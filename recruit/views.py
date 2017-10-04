from __future__ import unicode_literals
from django.conf import settings
from django.shortcuts import render, render_to_response, redirect
from django.http import HttpResponse, HttpResponseRedirect, HttpRequest, Http404,JsonResponse
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required,user_passes_test
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.models import User
from .models import *
from registration.models import *
import json
import datetime
import os
import unicodedata
from django.core.mail import send_mail
import smtplib

@login_required(login_url='/register')
def index(request) :
    response = {}
    app = Appdata.objects.get(user=request.user)
    if app.paymentUploaded == False :
        return redirect('/register/paymentDetails')
    if app.submitted :
        return redirect('/printSummary')
    profile = UserProfile.objects.get(user=request.user)
    print(profile)
    response['profile'] = profile
    if request.method == "POST" :
        #app_data object creation too.
        if not Appdata.objects.filter(user=request.user).exists() :
            app_data = Appdata()
            app_data.user = request.user
            app_data.app_id = profile.applicationID
            app_data.post_for = profile.postApplied
            app_data.post_in = profile.departmentApplied
            app_data.save()

        appD = Appdata.objects.get(user=request.user)
        app_id = Appdata.objects.get(user=request.user)
        postID = Post.objects.get(name=appD.post_for).postID
        if postID==1 :
            print request.POST.get('agp1')
            if request.POST.get('agp1')=='on' :
                app_id.agp1 = True
                app_id.save()
            else :
                app_id.agp1 = False
                app_id.save()
            if request.POST.get('agp2') :
                app_id.agp2 = True
                app_id.save()
            else :
                app_id.agp2 = False
                app_id.save()
            if request.POST.get('agp3') :
                app_id.agp3 = True
                app_id.save()
            else :
                app_id.agp3 = False
                app_id.save()
        #generalInfo part  :
        app_id.specialize = request.POST['specialization']
        app_id.save()

        if not FacUser.objects.filter(app_id=app_id).exists() :
            facuser = FacUser()
            facuser.app_id = app_id
        else :
            facuser = FacUser.objects.get(app_id=app_id)
        facuser.full_name = request.POST['Name']
        facuser.gender = request.POST['gender']
        facuser.father_name = request.POST['fatherName']
        facuser.father_occ = request.POST.get('fatherOccupation')
        facuser.mother_name = request.POST['motherName']
        facuser.mother_occ = request.POST.get('motherOccupation')
        facuser.nation = request.POST['nationality']
        facuser.pob = request.POST['birthplace']
        facuser.dob = request.POST['dateOfBirth']
        facuser.age = calculate_age(facuser.dob)
        facuser.correspond_addr = request.POST['corresAddress']
        facuser.permanent_addr = request.POST['permanentAddress']
        facuser.category = request.POST.get('category')
        facuser.pwd = request.POST.get('pwd')
        facuser.aadhaarNo = request.POST.get('aadhaar')
        facuser.save()

        #Experience Part
        if not Experience.objects.filter(app_id=app_id).exists() :
            exp = Experience()
            exp.app_id = app_id
            exp.teaching_data = request.POST['teachingExpData']
            exp.research_data = request.POST['researchExpData']
            exp.industrial_data = request.POST['industryExpData']
        else :
            exp = Experience.objects.get(app_id=app_id)
            if len(request.POST['teachingExpData'])>2 :
                oldstr = exp.teaching_data
                newstr = request.POST['teachingExpData']
                exp.teaching_data = getJsonStringVal(oldstr,newstr)
            if len(request.POST['researchExpData'])>2 :
                oldstr = exp.research_data
                newstr = request.POST['researchExpData']
                exp.research_data = getJsonStringVal(oldstr,newstr)
            if len(request.POST['industryExpData'])>2 :
                oldstr = exp.industrial_data
                newstr = request.POST['industryExpData']
                exp.industrial_data = getJsonStringVal(oldstr,newstr)

        exp.teaching_exp = request.POST['teachingExperience']
        exp.postPhd_exp = request.POST['phdExperience']
        exp.research_exp = request.POST['researchExperience']
        exp.industrial_exp = request.POST['industryExperience']
        exp.save()

        #Qualification Part
        if not Qualification.objects.filter(app_id=app_id,degreeType='UG').exists():
            ugdegree = Qualification()
        else :
            ugdegree = Qualification.objects.get(app_id=app_id,degreeType='UG')
        ugdegree.app_id = app_id
        ugdegree.degreeType = 'UG'
        ugdegree.degreeName = request.POST['Bdegree']
        ugdegree.university = request.POST['Buniv']
        ugdegree.passingYear = request.POST['Bpassingyear']
        ugdegree.marks = request.POST['Bmarks']
        ugdegree.division = request.POST['Bdivision']
        ugdegree.save()

        if not Qualification.objects.filter(app_id=app_id,degreeType='PG').exists():
            pgdegree = Qualification()
        else :
            pgdegree = Qualification.objects.get(app_id=app_id,degreeType='PG')
        pgdegree.app_id = app_id
        pgdegree.degreeType = 'PG'
        pgdegree.degreeName = request.POST['Mdegree']
        pgdegree.university = request.POST['Muniv']
        pgdegree.passingYear = request.POST['Mpassingyear']
        pgdegree.marks = request.POST['Mmarks']
        pgdegree.division = request.POST['Mdivision']
        pgdegree.save()

        if not Qualification.objects.filter(app_id=app_id,degreeType='PHD').exists():
            phdDegree = Qualification()
        else :
            phdDegree = Qualification.objects.get(app_id=app_id,degreeType='PHD')
        phdDegree.app_id = app_id
        phdDegree.degreeType = 'PHD'
        phdDegree.degreeName = request.POST['Phddegree']
        phdDegree.university = request.POST['Phduniv']
        phdDegree.passingYear = request.POST['Phdpassingyear']
        phdDegree.marks = request.POST.get('Phdmarks')
        phdDegree.division = request.POST.get('Phddivision')
        phdDegree.save()

        if not Qualification.objects.filter(app_id=app_id,degreeType='other').exists():
            if request.POST.get('Odegree') :
                ODegree = Qualification()
                ODegree.app_id = app_id
                ODegree.degreeType = 'other'
                ODegree.degreeName = request.POST.get('Odegree')
                ODegree.university = request.POST.get('Ouniv')
                ODegree.passingYear = request.POST.get('Opassingyear')
                ODegree.marks = request.POST.get('Omarks')
                ODegree.division = request.POST.get('Odivision')
                ODegree.save()
        else :
            ODegree = Qualification.objects.get(app_id=app_id,degreeType='other')
            ODegree.app_id = app_id
            ODegree.degreeType = 'other'
            ODegree.degreeName = request.POST.get('Odegree')
            ODegree.university = request.POST.get('Ouniv')
            ODegree.passingYear = request.POST.get('Opassingyear')
            ODegree.marks = request.POST.get('Omarks')
            ODegree.division = request.POST.get('Odivision')
            ODegree.save()

    if Appdata.objects.filter(user=request.user).exists() :
        app_id = Appdata.objects.get(user=request.user)
        response['agp1'] = app_id.agp1
        response['agp2'] = app_id.agp2
        response['agp3'] = app_id.agp3
        response['postID'] = Post.objects.get(name=app_id.post_for).postID
        response['specialization'] = app_id.specialize
        if FacUser.objects.filter(app_id=app_id).exists():
            response['generalData'] = FacUser.objects.get(app_id=app_id)
        if Experience.objects.filter(app_id=app_id).exists():
            exp = Experience.objects.get(app_id=app_id)
            response['Experience'] = exp
            response['teachingData'] = json.loads(exp.teaching_data)
            response['researchData'] = json.loads(exp.research_data)
            response['industryData'] = json.loads(exp.industrial_data)

        if Qualification.objects.filter(app_id=app_id,degreeType='UG').exists():
            response['Bqual'] = Qualification.objects.get(app_id=app_id,degreeType='UG')
        if Qualification.objects.filter(app_id=app_id,degreeType='PG').exists():
            response['Mqual'] = Qualification.objects.get(app_id=app_id,degreeType='PG')
        if Qualification.objects.filter(app_id=app_id,degreeType='PHD').exists():
            response['Phdqual'] = Qualification.objects.get(app_id=app_id,degreeType='PHD')
        if Qualification.objects.filter(app_id=app_id,degreeType='other').exists():
            response['Oqual'] = Qualification.objects.get(app_id=app_id,degreeType='other')
        acad_annex_a = Acad_Annex_A.objects.filter(app_id=app_id)
        if acad_annex_a.count() > 0:
            response['acad_annex_a'] = acad_annex_a[0].store
        if Paper.objects.filter(app_id=app_id).exists() :
            paperobj = Paper.objects.get(app_id=app_id)
            response['paperobj'] = paperobj

    return render(request,'recruit/mainForm.djt',response)

@login_required(login_url='/register')
def academic(request):

    response = {}
    app_id = Appdata.objects.get(user=request.user)
    if app_id.submitted :
        return redirect('/printSummary')
    # app_id = Appdata.objects.get(post_for='123')
    external_sponsored_rnd = External_Sponsored_RnD.objects.filter(app_id=app_id)
    consultancy_projects = Consultancy_Projects.objects.filter(app_id=app_id)
    phd_completed = PhD_Completed.objects.filter(app_id=app_id)
    journal_papers = Journal_Papers.objects.filter(app_id = app_id)
    conference_paper_sci = Conference_Paper_SCI.objects.filter(app_id = app_id)


    acad_annex_a = Acad_Annex_A.objects.filter(app_id=app_id)
    acad_annex_b = Acad_Annex_B.objects.filter(app_id=app_id)
    acad_annex_c = Acad_Annex_C.objects.filter(app_id=app_id)
    acad_annex_d = Acad_Annex_D.objects.filter(app_id=app_id)
    acad_annex_e12 = Acad_Annex_E12.objects.filter(app_id=app_id)
    acad_annex_f = Acad_Annex_F.objects.filter(app_id=app_id)
    acad_annex_g = Acad_Annex_G.objects.filter(app_id=app_id)
    acad_annex_h = Acad_Annex_H.objects.filter(app_id=app_id)
    acad_annex_i = Acad_Annex_I.objects.filter(app_id=app_id)
    acad_annex_j = Acad_Annex_J.objects.filter(app_id=app_id)
    acad_annex_k = Acad_Annex_K.objects.filter(app_id=app_id)
    acad_annex_l = Acad_Annex_L.objects.filter(app_id=app_id)
    acad_annex_m = Acad_Annex_M.objects.filter(app_id=app_id)
    acad_annex_n = Acad_Annex_N.objects.filter(app_id=app_id)
    acad_annex_o = Acad_Annex_O.objects.filter(app_id=app_id)
    acad_annex_p = Acad_Annex_P.objects.filter(app_id=app_id)
    acad_annex_q = Acad_Annex_Q.objects.filter(app_id=app_id)
    acad_annex_r = Acad_Annex_R.objects.filter(app_id=app_id)
    acad_annex_s = Acad_Annex_S.objects.filter(app_id=app_id)
    acad_annex_t = Acad_Annex_T.objects.filter(app_id=app_id)
    acad_annex_u = Acad_Annex_U.objects.filter(app_id=app_id)
    acad_annex_v = Acad_Annex_V.objects.filter(app_id=app_id)
    acad_annex_w1_w2 = Acad_Annex_W1_W2.objects.filter(app_id=app_id)
    acad_annex_x = Acad_Annex_X.objects.filter(app_id=app_id)
    acad_annex_y = Acad_Annex_Y.objects.filter(app_id=app_id)
    acad_annex_z = Acad_Annex_Z.objects.filter(app_id=app_id)

    if request.method == "POST":
        if external_sponsored_rnd.count() == 0:
            external_sponsored_rnd = External_Sponsored_RnD()
            external_sponsored_rnd.app_id = app_id
            external_sponsored_rnd.projects_not_pi = request.POST['projects_not_pi']
            external_sponsored_rnd.patents_not_pi = request.POST['patents_not_pi']
            external_sponsored_rnd.save()
        else:
            external_sponsored_rnd = external_sponsored_rnd[0]
        external_sponsored_rnd.total_projects = request.POST['total_projects']
        external_sponsored_rnd.project_as_PI = request.POST['projects_as_PI']
        external_sponsored_rnd.total_patents = request.POST['total_patents']
        external_sponsored_rnd.patents_as_pi = request.POST['patents_as_pi']
        external_sponsored_rnd.credit_val = request.POST['credits_1']
        # external_sponsored_rnd.patents_not_pi = request.POST['patents_not_pi']
        # if len(request.POST['projects_not_pi'])>2:
        #     oldstr = external_sponsored_rnd.projects_not_pi
        #     newstr = request.POST['projects_not_pi']
        #     external_sponsored_rnd.projects_not_pi = oldstr[:-1] + "," + newstr[1:]

        if len(request.POST['projects_not_pi'])>2:
            oldstr = external_sponsored_rnd.projects_not_pi
            newstr = request.POST['projects_not_pi']
            if oldstr == '[]':
                external_sponsored_rnd.projects_not_pi = "[" + newstr[1:]
            else:
                external_sponsored_rnd.projects_not_pi = oldstr[:-1] + "," + newstr[1:]
        
        # if len(request.POST['patents_not_pi'])>2:
        #     oldstr = external_sponsored_rnd.patents_not_pi
        #     newstr = request.POST['patents_not_pi']
        #     external_sponsored_rnd.patents_not_pi = oldstr[:-1] + "," + newstr[1:]
        if len(request.POST['patents_not_pi'])>2:
            oldstr = external_sponsored_rnd.patents_not_pi
            newstr = request.POST['patents_not_pi']
            if oldstr == '[]':
                external_sponsored_rnd.patents_not_pi = "[" + newstr[1:]
            else:
                external_sponsored_rnd.patents_not_pi = oldstr[:-1] + "," + newstr[1:]

        external_sponsored_rnd.save()

        response['external_sponsored_rnd'] = external_sponsored_rnd

        if external_sponsored_rnd.projects_not_pi:
            response['projects_not_pi'] = json.loads(external_sponsored_rnd.projects_not_pi)
        if external_sponsored_rnd.patents_not_pi:
            response['patents_not_pi'] = json.loads(external_sponsored_rnd.patents_not_pi)

        if consultancy_projects.count() == 0:
            consultancy_projects = Consultancy_Projects()
            consultancy_projects.app_id = app_id
        else:
            consultancy_projects = consultancy_projects[0]
        consultancy_projects.consultancy_projects_completed = request.POST['consultancy_projects_completed']
        consultancy_projects.amount = request.POST['amount']
        consultancy_projects.credit_val = request.POST['credits_2']
        consultancy_projects.save()
        response['consultancy_projects'] = consultancy_projects

        if phd_completed.count() == 0:
            phd_completed = PhD_Completed()
            phd_completed.app_id = app_id
            phd_completed.phds = request.POST['phds']
            phd_completed.save()
        else:
            phd_completed = phd_completed[0]
        phd_completed.total_phd = request.POST['total_phd']
        phd_completed.credit_val = request.POST['credits_3']
        phd_completed.as_first_supervisor = request.POST['as_first_supervisor_phd']
        if len(request.POST['phds'])>2:
            oldstr = phd_completed.phds
            newstr = request.POST['phds']
            if oldstr == "[]":
                phd_completed.phds = "[" + newstr[1:]
            else:
                phd_completed.phds = oldstr[:-1] + "," + newstr[1:]
        phd_completed.save()
        response['phd_completed'] = phd_completed
        if phd_completed.phds:
            response['phds'] = json.loads(phd_completed.phds)

        if journal_papers.count() == 0:
            journal_papers = Journal_Papers()
            journal_papers.app_id = app_id
            journal_papers.papers = request.POST['papers']
            journal_papers.save()
        else:
            journal_papers = journal_papers[0]
        journal_papers.total_journal_papers = request.POST['total_journal_papers']
        journal_papers.as_first_supervisor = request.POST['as_first_supervisor_journal']
        journal_papers.credit_val = request.POST['credits_4']
        if len(request.POST['papers'])>2:
            oldstr = journal_papers.papers
            newstr = request.POST['papers']
            if oldstr == "[]":
                journal_papers.papers = "[" + newstr[1:]
            else:
                journal_papers.papers = oldstr[:-1] + "," + newstr[1:]

        journal_papers.save()
        response['journal_papers'] = journal_papers
        if journal_papers.papers:
            response['papers'] = json.loads(journal_papers.papers)

        if conference_paper_sci.count() == 0:
            conference_paper_sci = Conference_Paper_SCI()
            conference_paper_sci.app_id = app_id
            conference_paper_sci.papers = request.POST['papers1']
            conference_paper_sci.save()
        else:
            conference_paper_sci = conference_paper_sci[0]
        conference_paper_sci.total_confernce_papers = request.POST['total_confernce_papers']
        conference_paper_sci.as_first_supervisor = request.POST['as_first_supervisor_conference']
        conference_paper_sci.credit_val = request.POST['credits_5']
        if len(request.POST['papers1'])>2:
            oldstr = journal_papers.papers
            newstr = request.POST['papers1']
            if oldstr == "[]":
                conference_paper_sci.papers = "[" + newstr[1:]
            else:
                conference_paper_sci.papers = oldstr[:-1] + "," + newstr[1:]

        conference_paper_sci.save()
        response['conference_paper_sci'] = conference_paper_sci
        if conference_paper_sci.papers:
            response['papers1'] = json.loads(conference_paper_sci.papers)

        if acad_annex_j.count() == 0:
            acad_annex_j = Acad_Annex_J()
            acad_annex_j.app_id = app_id
        else:
            acad_annex_j = acad_annex_j[0]
        acad_annex_j.total_sem = request.POST['total_semj']
        acad_annex_j.credit_val = request.POST['credits_6']
        acad_annex_j.save()
        response['acad_annex_j'] = acad_annex_j

        if acad_annex_k.count() == 0:
            acad_annex_k = Acad_Annex_K()
            acad_annex_k.app_id = app_id
        else:
            acad_annex_k = acad_annex_k[0]
        acad_annex_k.total_sem = request.POST['total_semk']
        acad_annex_k.credit_val = request.POST['credits_7']
        acad_annex_k.save()
        response['acad_annex_k'] = acad_annex_k

        if acad_annex_l.count() == 0:
            acad_annex_l = Acad_Annex_L()
            acad_annex_l.app_id = app_id
        else:
            acad_annex_l = acad_annex_l[0]
        acad_annex_l.total_sem = request.POST['total_seml']
        acad_annex_l.credit_val = request.POST['credits_8']
        acad_annex_l.save()
        response['acad_annex_l'] = acad_annex_l

        if acad_annex_m.count() == 0:
            acad_annex_m = Acad_Annex_M()
            acad_annex_m.app_id = app_id
        else:
            acad_annex_m = acad_annex_m[0]
        acad_annex_m.total_sem = request.POST['total_semm']
        acad_annex_m.credit_val = request.POST['credits_9']
        acad_annex_m.save()
        response['acad_annex_m'] = acad_annex_m

        if acad_annex_n.count() == 0:
            acad_annex_n = Acad_Annex_N()
            acad_annex_n.app_id = app_id
        else:
            acad_annex_n = acad_annex_n[0]
        acad_annex_n.total_number = request.POST['total_numbern']
        acad_annex_n.credit_val = request.POST['credits_10']
        acad_annex_n.save()
        response['acad_annex_n'] = acad_annex_n

        if acad_annex_o.count() == 0:
            acad_annex_o = Acad_Annex_O()
            acad_annex_o.app_id = app_id
        else:
            acad_annex_o = acad_annex_o[0]
        acad_annex_o.prog_2_week_duration = request.POST['prog_2_week_duration']
        acad_annex_o.prog_1_week_duration = request.POST['prog_1_week_duration']
        acad_annex_o.credit_val = request.POST['credits_11']
        acad_annex_o.save()
        response['acad_annex_o'] = acad_annex_o

        if acad_annex_p.count() == 0:
            acad_annex_p = Acad_Annex_P()
            acad_annex_p.app_id = app_id
        else:
            acad_annex_p = acad_annex_p[0]
        acad_annex_p.total_number = request.POST['total_numberp']
        acad_annex_p.credit_val = request.POST['credits_12']
        acad_annex_p.save()
        response['acad_annex_p'] = acad_annex_p

        if acad_annex_q.count() == 0:
            acad_annex_q = Acad_Annex_Q()
            acad_annex_q.app_id = app_id
        else:
            acad_annex_q = acad_annex_q[0]
        acad_annex_q.total_years = request.POST['total_years']
        acad_annex_q.total_months = request.POST['total_months']
        acad_annex_q.credit_val = request.POST['credits_13']
        acad_annex_q.save()
        response['acad_annex_q'] = acad_annex_q

        if acad_annex_r.count() == 0:
            acad_annex_r = Acad_Annex_R()
            acad_annex_r.app_id = app_id
        else:
            acad_annex_r = acad_annex_r[0]
        acad_annex_r.total_number = request.POST['total_numberr']
        acad_annex_r.credit_val = request.POST['credits_14']
        acad_annex_r.save()
        response['acad_annex_r'] = acad_annex_r

        if acad_annex_s.count() == 0:
            acad_annex_s = Acad_Annex_S()
            acad_annex_s.app_id = app_id
        else:
            acad_annex_s = acad_annex_s[0]
        acad_annex_s.total_credit = request.POST['total_creditss']
        acad_annex_s.credit_val = request.POST['credits_15']
        acad_annex_s.save()
        response['acad_annex_s'] = acad_annex_s

        if acad_annex_t.count() == 0:
            acad_annex_t = Acad_Annex_T()
            acad_annex_t.app_id = app_id
        else:
            acad_annex_t = acad_annex_t[0]
        acad_annex_t.total_number = request.POST['total_numbert']
        acad_annex_t.credit_val = request.POST['credits_16']
        acad_annex_t.save()
        response['acad_annex_t'] = acad_annex_t

        if acad_annex_u.count() == 0:
            acad_annex_u = Acad_Annex_U()
            acad_annex_u.app_id = app_id
        else:
            acad_annex_u = acad_annex_u[0]
        acad_annex_u.total_number = request.POST['total_numberu']
        acad_annex_u.credit_val = request.POST['credits_17']
        acad_annex_u.save()
        response['acad_annex_u'] = acad_annex_u

        if acad_annex_v.count() == 0:
            acad_annex_v = Acad_Annex_V()
            acad_annex_v.app_id = app_id
        else:
            acad_annex_v = acad_annex_v[0]
        acad_annex_v.total_number = request.POST['total_numberv']
        acad_annex_v.credit_val = request.POST['credits_18']
        acad_annex_v.save()
        response['acad_annex_v'] = acad_annex_v

        if acad_annex_w1_w2.count() == 0:
            acad_annex_w1_w2 = Acad_Annex_W1_W2()
            acad_annex_w1_w2.app_id = app_id
        else:
            acad_annex_w1_w2 = acad_annex_w1_w2[0]
        acad_annex_w1_w2.total_number = request.POST['total_numberw1_w2']
        acad_annex_w1_w2.credit_val = request.POST['credits_19']
        acad_annex_w1_w2.save()
        response['acad_annex_w1_w2'] = acad_annex_w1_w2

        if acad_annex_x.count() == 0:
            acad_annex_x = Acad_Annex_X()
            acad_annex_x.app_id = app_id
        else:
            acad_annex_x = acad_annex_x[0]
        acad_annex_x.total_number = request.POST['total_numberx']
        acad_annex_x.credit_val = request.POST['credits_20']
        acad_annex_x.save()
        response['acad_annex_x'] = acad_annex_x

        if acad_annex_y.count() == 0:
            acad_annex_y = Acad_Annex_Y()
            acad_annex_y.app_id = app_id
        else:
            acad_annex_y = acad_annex_y[0]
        acad_annex_y.value = request.POST['valueyon']
        acad_annex_y.credit_val = request.POST['credits_21']
        acad_annex_y.save()
        response['acad_annex_y'] = acad_annex_y

        if acad_annex_z.count() == 0:
            acad_annex_z = Acad_Annex_Z()
            acad_annex_z.app_id = app_id
        else:
            acad_annex_z = acad_annex_z[0]
        acad_annex_z.percentage = request.POST['percentagez']
        acad_annex_z.credit_val = request.POST['credits_22']
        acad_annex_z.save()
        response['acad_annex_z'] = acad_annex_z
	
	return redirect('/academic')	

        return redirect('/academic')

    else:
        if external_sponsored_rnd.count() > 0:
            response['external_sponsored_rnd'] = external_sponsored_rnd[0]
            if external_sponsored_rnd[0].projects_not_pi:
                response['projects_not_pi'] = json.loads(external_sponsored_rnd[0].projects_not_pi)
            if external_sponsored_rnd[0].patents_not_pi:
                response['patents_not_pi'] = json.loads(external_sponsored_rnd[0].patents_not_pi)

        if consultancy_projects.count() > 0:
            response['consultancy_projects'] = consultancy_projects[0]

        if phd_completed.count() > 0:
            response['phd_completed'] = phd_completed[0]
            if phd_completed[0].phds:
                response['phds'] = json.loads(phd_completed[0].phds)
            
        if journal_papers.count() > 0:
            response['journal_papers'] = journal_papers[0]
            if journal_papers[0].papers:
                response['papers'] = json.loads(journal_papers[0].papers)
            
        if conference_paper_sci.count() > 0:
            response['conference_paper_sci'] = conference_paper_sci[0]
            if conference_paper_sci[0].papers:
                response['papers1'] = json.loads(conference_paper_sci[0].papers)
            
        if acad_annex_a.count() > 0:
            response['acad_annex_a'] = acad_annex_a[0]

        if acad_annex_b.count() > 0:
            response['acad_annex_b'] = acad_annex_b[0]
        if acad_annex_c.count() > 0:
            response['acad_annex_c'] = acad_annex_c[0]

        if acad_annex_d.count() > 0:
            response['acad_annex_d'] = acad_annex_d[0]

        if acad_annex_e12.count() > 0:
            response['acad_annex_e12'] = acad_annex_e12[0]
            response['total_e'] = float(acad_annex_e12[0].total_e1 + acad_annex_e12[0].total_e2)

        if acad_annex_f.count() > 0:
            response['acad_annex_f'] = acad_annex_f[0]

        if acad_annex_g.count() > 0:
            response['acad_annex_g'] = acad_annex_g[0]

        if acad_annex_h.count() > 0:
            response['acad_annex_h'] = acad_annex_h[0]

        if acad_annex_i.count() > 0:
            response['acad_annex_i'] = acad_annex_i[0]

        if acad_annex_j.count() > 0:
            response['acad_annex_j'] = acad_annex_j[0]

        if acad_annex_k.count() > 0:
            response['acad_annex_k'] = acad_annex_k[0]

        if acad_annex_l.count() > 0:
            response['acad_annex_l'] = acad_annex_l[0]

        if acad_annex_m.count() > 0:
            response['acad_annex_m'] = acad_annex_m[0]

        if acad_annex_n.count() > 0:
            response['acad_annex_n'] = acad_annex_n[0]

        if acad_annex_o.count() > 0:
            response['acad_annex_o'] = acad_annex_o[0]

        if acad_annex_p.count() > 0:
            response['acad_annex_p'] = acad_annex_p[0]

        if acad_annex_q.count() > 0:
            response['acad_annex_q'] = acad_annex_q[0]  

        if acad_annex_r.count() > 0:
            response['acad_annex_r'] = acad_annex_r[0]

        if acad_annex_s.count() > 0:
            response['acad_annex_s'] = acad_annex_s[0]

        if acad_annex_t.count() > 0:
            response['acad_annex_t'] = acad_annex_t[0]

        if acad_annex_u.count() > 0:
            response['acad_annex_u'] = acad_annex_u[0]

        if acad_annex_v.count() > 0:
            response['acad_annex_v'] = acad_annex_v[0]

        if acad_annex_w1_w2.count() > 0:
            response['acad_annex_w1_w2'] = acad_annex_w1_w2[0]
            response['total_w'] = float(acad_annex_w1_w2[0].total_w1 + acad_annex_w1_w2[0].total_w2)

        if acad_annex_x.count() > 0:
            response['acad_annex_x'] = acad_annex_x[0]

        if acad_annex_y.count() > 0:
            response['acad_annex_y'] = acad_annex_y[0]

        if acad_annex_z.count() > 0:
            response['acad_annex_z'] = acad_annex_z[0]

    return render(request, 'recruit/acad_other_req.djt', response)

@login_required(login_url='/register')
def annexure_a(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_A.objects.get(app_id=app_data)
            if len(request.POST['annexure_a'])>2:
                oldstr = annexure.annexure_data
                newstr = request.POST['annexure_a']
                if oldstr == " " or oldstr=="[]":
                    annexure.annexure_data = "[" + newstr[1:]
                else:
                    annexure.annexure_data = oldstr[:-1] + "," + newstr[1:]
            annexure.total = 0
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
            print "puranaA"
        except ObjectDoesNotExist:
            annexure = Acad_Annex_A()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_a']
            annexure.total = 0
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
            print annexure
        return redirect('/')
    annex_a = Acad_Annex_A.objects.filter(app_id=app_data)
    if annex_a.count() > 0:
        if len(unicodedata.normalize("NFKD",annex_a[0].annexure_data)) > 1:
            response['annex_a'] = json.loads(annex_a[0].annexure_data)
        response['annexure_file'] = annex_a[0].annexure_file
    return render(request,'recruit/annexure/annexure_a.djt',response)

@login_required(login_url='/register')
def annexure_b(request) :
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_B.objects.get(app_id=app_data)
            annexure.annexure_data = request.POST['annexure_b']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_B()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_b']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
        annex_b = Acad_Annex_B.objects.filter(app_id=app_data)
        response= {}
        response['annexure_file'] = annex_b[0].annexure_file
    return render(request,'recruit/annexure/annexure-b.djt',response)

@login_required(login_url='/register')
def annexure_c(request) :
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_C.objects.get(app_id=app_data)
            annexure.annexure_data = request.POST['annexure_c']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_C()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_c']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
        annex_c = Acad_Annex_C.objects.filter(app_id=app_data)
        response= {}
        response['annexure_file'] = annex_c[0].annexure_file
    return render(request,'recruit/annexure/annexure-c.djt',response)


@login_required(login_url='/register')
def annexure_d(request) :
    response= {}
    app_data = Appdata.objects.get(user = request.user)
    if(request.POST):
        try:
            annexure = Acad_Annex_D.objects.get(app_id=app_data)
            if(request.POST['basic_pay']):
                annexure.basic_pay_r = request.POST['basic_pay']
                annexure.payband_r = request.POST['payband']
                annexure.payband_end_r = request.POST['payband_b']
                annexure.total_r = request.POST['total_a']
            annexure.store = True
            if(request.POST['basic_pay_d']):
                annexure.basic_pay_d = request.POST['basic_pay_d']
                annexure.payband_d = request.POST['payband_d']
                annexure.payband_end_d = request.POST['payband_b_d']
                annexure.total_d = request.POST['total_ad']
            annexure.total = (request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_D()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            if(request.POST['basic_pay']):
                annexure.basic_pay_r = request.POST['basic_pay']
                annexure.payband_r = request.POST['payband']
                annexure.payband_end_r = request.POST['payband_b']
                annexure.total_r = request.POST['total_a']
                annexure.store = True
            elif(request.POST['basic_pay_d']):
                annexure.basic_pay_d = request.POST['basic_pay_d']
                annexure.payband_d = request.POST['payband_d']
                annexure.payband_end_d = request.POST['payband_b_d']
                annexure.total_d = request.POST['total_ad']
            annexure.total = (request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
        annex_d = Acad_Annex_D.objects.filter(app_id=app_data)
        response['annexure_file'] = annex_d[0].annexure_file
    return render(request,'recruit/annexure/annexure_d.djt',response)

@login_required(login_url='/register')
def annexure_e_1(request) :
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    if(request.POST):
        try:
            annexure = Acad_Annex_E12.objects.get(app_id=app_data)
            if len(request.POST['annexure_e1'])>2:
                oldstr = annexure.annexure_data_e1
                newstr = request.POST['annexure_e1']
                if oldstr == " " or oldstr=="[]":
                    annexure.annexure_data_e1 = "[" + newstr[1:]
                else:
                    annexure.annexure_data_e1 = oldstr[:-1] + "," + newstr[1:]
            annexure.store_e1 = True
            annexure.total_e1 = float(request.POST.get('total_e1',0));
            # annexure.total_e1 = request.POST['total_e1']
            if request.FILES:
                annexure.annexure_file_e1 = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_E12()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data_e1 = request.POST['annexure_e1']
            annexure.total_e1 = float(request.POST.get('total_e1',0))
            annexure.store_e1 = True
            if request.FILES:
                annexure.annexure_file_e1 = request.FILES['annexure_file']
            annexure.save()
            annexure.total_e1 = annexure.total_e1+float(request.POST.get('total_e1',0));
        return redirect('academic/')
    annex_e1 = Acad_Annex_E12.objects.filter(app_id=app_data)
    if annex_e1.count() > 0:
        if len(unicodedata.normalize("NFKD",annex_e1[0].annexure_data_e1)) > 1:
            response['annex_e1'] = json.loads(annex_e1[0].annexure_data_e1)
            response['total_e1'] = annex_e1[0].total_e1;
            response['annexure_file'] = annex_e1[0].annexure_file_e1
    return render(request,'recruit/annexure/annexure-e-1.djt',response)

@login_required(login_url='/register')
def annexure_e2(request):
    app_data = Appdata.objects.get(user = request.user)
    response = {}
    if(request.POST):
        try:
            annexure = Acad_Annex_E12.objects.get(app_id=app_data)
            if len(request.POST['annexure_e2'])>2:
                oldstr = annexure.annexure_data_e2
                newstr = request.POST['annexure_e2']
                if oldstr == " " or oldstr == "[]":
                    annexure.annexure_data_e2 = "[" + newstr[1:]
                else:
                    annexure.annexure_data_e2 = oldstr[:-1] + "," + newstr[1:]
            # annexure.total_e2 = request.POST['total_e2']
            annexure.store_e2 = True
            annexure.total_e2 = float(request.POST.get('total_e2',0));
            if request.FILES:
                annexure.annexure_file_e2 = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_E12()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data_e2 = request.POST['annexure_e2']
            annexure.total_e2 = request.POST['total_e2']
            annexure.store_e2 = True
            #annexure.total_e2 = annexure.total_e2+float(request.POST.get('total_e2',0));
            if request.FILES:
                annexure.annexure_file_e2 = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_e2 = Acad_Annex_E12.objects.filter(app_id=app_data)
    if annex_e2.count() > 0:
        if len(str((annex_e2[0].annexure_data_e2).encode("utf-8"))) > 1:
            response['annex_e2'] = json.loads(annex_e2[0].annexure_data_e2)
            response['total_e2'] = annex_e2[0].total_e2;
            response['annexure_file'] = annex_e2[0].annexure_file_e2
    return render(request,'recruit/annexure/annexure_e2.djt',response)

@login_required(login_url='/register')
def annexure_f(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    if(request.POST):
        try:
            annexure = Acad_Annex_F.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_f')
            annexure.store = True
            annexure.credit_score = float(request.POST['credit'])
            annexure.total = float(request.POST.get('total',0));
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_F()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_f']
            annexure.store = True
            annexure.credit_score = float(request.POST['credit'])
            annexure.total = annexure.total+float(request.POST.get('total',0));
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_f = Acad_Annex_F.objects.filter(app_id=app_data)
    if annex_f.count() > 0:
        if annex_f[0].annexure_data:
            response['annex_f'] = json.loads(annex_f[0].annexure_data)
            response['credit'] = annex_f[0].credit_score
            response['total'] = annex_f[0].total
            response['annexure_file'] = annex_f[0].annexure_file
    return render(request,'recruit/annexure/annexure_f.djt',response)

@login_required(login_url='/register')
def annexure_g(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    if(request.POST):
        try:
            annexure = Acad_Annex_G.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_g')
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_G()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_g']
            annexure.total = annexure.total+float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_g = Acad_Annex_G.objects.filter(app_id=app_data)
    if annex_g.count() > 0:
        if annex_g[0].annexure_data:
            response['annex_g'] = json.loads(annex_g[0].annexure_data)
            response['total'] = annex_g[0].total
            response['annexure_file'] = annex_g[0].annexure_file
    return render(request,'recruit/annexure/annexure_g.djt',response)

@login_required(login_url='/register')
def annexure_h(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_H.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_h')
	    val = annexure.annexure_data
	    annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_H()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_h']
            annexure.last_prom = request.POST['last_prom']
            annexure.total = annexure.total+float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_h = Acad_Annex_H.objects.filter(app_id=app_data)
    if annex_h.count() > 0:
        if annex_h[0].annexure_data:
            response['annex_h'] = json.loads(annex_h[0].annexure_data)
            response['last_prom'] = annex_h[0].last_prom
            response['total'] = annex_h[0].total
            response['annexure_file'] = annex_h[0].annexure_file
    return render(request,'recruit/annexure/annexure_h.djt',response)

@login_required(login_url='/register')
def annexure_i(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_I.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_i')
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_I()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_i']
            annexure.total = annexure.total+float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_i = Acad_Annex_I.objects.filter(app_id=app_data)
    if annex_i.count() > 0:
        if annex_i[0].annexure_data:
            response['annex_i'] = json.loads(annex_i[0].annexure_data)
            response['total'] = annex_i[0].total
            response['annexure_file'] = annex_i[0].annexure_file
    return render(request,'recruit/annexure/annexure_i.djt',response)

@login_required(login_url='/register')
def annexure_j(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_J.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_j')
            annexure.store = True
            annexure.credit_score = float(request.POST.get('credit',0));
            annexure.total = float(request.POST.get('total',0));
            annexure.last_prom = request.POST['last_prom']
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_J()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_j']
            annexure.store = True
            annexure.credit_score = float(request.POST.get('credit',0));
            annexure.total = annexure.total+float(request.POST.get('total',0));
            annexure.last_prom = request.POST['last_prom']
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_j = Acad_Annex_J.objects.filter(app_id=app_data)
    if annex_j.count() > 0:
        if annex_j[0].annexure_data:
            response['annex_j'] = json.loads(annex_j[0].annexure_data)
            response['credit'] = annex_j[0].credit_score
            response['last_prom'] = annex_j[0].last_prom
            response['total'] = annex_j[0].total
            response['annexure_file'] = annex_j[0].annexure_file
    return render(request,'recruit/annexure/annexure_j.djt',response)

@login_required(login_url='/register')
def annexure_k(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        try:
            annexure = Acad_Annex_K.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_k')
            annexure.credit_score = float(request.POST.get('credit',0));
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_K()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_k']
            annexure.credit_score = float(request.POST.get('credit',0));
            annexure.last_prom = request.POST['last_prom']
            annexure.total = annexure.total+float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_k = Acad_Annex_K.objects.filter(app_id=app_data)
    if annex_k.count() > 0:
        if annex_k[0].annexure_data:
            response['annex_k'] = json.loads(annex_k[0].annexure_data)
            response['credit'] = annex_k[0].credit_score
            response['last_prom'] = annex_k[0].last_prom
            response['total'] = annex_k[0].total
            response['annexure_file'] = annex_k[0].annexure_file
    return render(request,'recruit/annexure/annexure_k.djt',response)

@login_required(login_url='/register')
def annexure_l(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        try:
            annexure = Acad_Annex_L.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_l')
            annexure.credit_score = float(request.POST.get('credit',0));
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_L()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_l']
            annexure.credit_score = float(request.POST.get('credit',0));
            annexure.last_prom = request.POST['last_prom']
            annexure.total = annexure.total+float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_l = Acad_Annex_L.objects.filter(app_id=app_data)
    if annex_l.count() > 0:
        if annex_l[0].annexure_data:
            response['annex_l'] = json.loads(annex_l[0].annexure_data)
            response['last_prom'] = annex_l[0].last_prom
            response['credit'] = annex_l[0].credit_score
            response['total'] = annex_l[0].total
            response['annexure_file'] = annex_l[0].annexure_file
    return render(request,'recruit/annexure/annexure_l.djt',response)

@login_required(login_url='/register')
def annexure_m(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_M.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_m')
            annexure.credit_score = float(request.POST.get('credit',0));
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_M()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_m']
            annexure.credit_score = float(request.POST.get('credit',0));
            annexure.last_prom = request.POST['last_prom']
            annexure.total = annexure.total+float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_m = Acad_Annex_M.objects.filter(app_id=app_data)
    if annex_m.count() > 0:
        if annex_m[0].annexure_data:
            response['annex_m'] = json.loads(annex_m[0].annexure_data)
            response['credit'] = annex_m[0].credit_score
            response['last_prom'] = annex_m[0].last_prom
            response['total'] = annex_m[0].total
            response['annexure_file'] = annex_m[0].annexure_file
    return render(request,'recruit/annexure/annexure_m.djt',response)

@login_required(login_url='/register')
def annexure_n(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    if(request.POST):
        try:
            annexure = Acad_Annex_N.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_n')
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_N()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_n']
            annexure.last_prom = request.POST['last_prom']
            annexure.total = annexure.total+float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_n = Acad_Annex_N.objects.filter(app_id=app_data)
    if annex_n.count() > 0:
        if annex_n[0].annexure_data:
            response['annex_n'] = json.loads(annex_n[0].annexure_data)
            response['last_prom'] = annex_n[0].last_prom
            response['total'] = annex_n[0].total
            response['annexure_file'] = annex_n[0].annexure_file
    return render(request,'recruit/annexure/annexure_n.djt',response)

@login_required(login_url='/register')
def annexure_o(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_O.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_o')
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_O()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_o']
            annexure.last_prom = request.POST['last_prom']
            annexure.total = annexure.total+float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_o = Acad_Annex_O.objects.filter(app_id=app_data)
    if annex_o.count() > 0:
        if annex_o[0].annexure_data:
            response['annex_o'] = json.loads(annex_o[0].annexure_data)
            response['last_prom'] = annex_o[0].last_prom
            response['total'] = annex_o[0].total
            response['annexure_file'] = annex_o[0].annexure_file
    return render(request,'recruit/annexure/annexure_o.djt',response)

@login_required(login_url='/register')
def annexure_p(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_P.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_p')
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_P()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_p']
            annexure.last_prom = request.POST['last_prom']
            annexure.total = annexure.total+float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_p = Acad_Annex_P.objects.filter(app_id=app_data)
    if annex_p.count() > 0:
        if annex_p[0].annexure_data:
            response['annex_p'] = json.loads(annex_p[0].annexure_data)
            response['last_prom'] = annex_p[0].last_prom
            response['total'] = annex_p[0].total
            response['annexure_file'] = annex_p[0].annexure_file
    return render(request,'recruit/annexure/annexure_p.djt',response)

@login_required(login_url='/register')
def annexure_q(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_Q.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_q')
            annexure.last_prom = request.POST['last_prom']
            annexure.total_exp_after_phd = request.POST.get('exp_phd',0);
            annexure.total_exp_cur = request.POST.get('exp_cad',0);
            annexure.total_exp = float(request.POST.get('total',0));
            annexure.credit_score = float(request.POST.get('credit',0));
            annexure.total_yr = int(request.POST.get('total_yr',0));
            annexure.total_mnth = int(request.POST.get('total_mnth',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_Q()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_q']
            annexure.last_prom = request.POST['last_prom']
            annexure.total_exp_after_phd = request.POST.get('exp_phd',0);
            annexure.total_exp_cur = request.POST.get('exp_cad',0);
            annexure.total_exp = float(request.POST.get('total',0));
            annexure.credit_score = float(request.POST.get('credit',0));
            annexure.total_yr = annexure.total_yr+int(request.POST.get('total_yr',0));
            annexure.total_mnth = annexure.total_mnth+int(request.POST.get('total_mnth',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_q = Acad_Annex_Q.objects.filter(app_id=app_data)
    if annex_q.count() > 0:
        if annex_q[0].annexure_data:
            response['annex_q'] = json.loads(annex_q[0].annexure_data)
            response['last_prom'] = annex_q[0].last_prom
            response['exp_phd'] = annex_q[0].total_exp_after_phd
            response['exp_cur'] = annex_q[0].total_exp_cur
            response['tot_exp'] = annex_q[0].total_exp
            response['credit'] = annex_q[0].credit_score
            response['total_yr'] = annex_q[0].total_yr
            response['total_mnth'] = annex_q[0].total_mnth
            response['annexure_file'] = annex_q[0].annexure_file
    return render(request,'recruit/annexure/annexure_q.djt',response)

@login_required(login_url='/register')
def annexure_r(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_R.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_r')
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_R()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_r']
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_r = Acad_Annex_R.objects.filter(app_id=app_data)
    if annex_r.count() > 0:
        if annex_r[0].annexure_data:
            response['annex_r'] = json.loads(annex_r[0].annexure_data)
            response['last_prom'] = annex_r[0].last_prom
            response['total'] = annex_r[0].total
            response['annexure_file'] = annex_r[0].annexure_file
    return render(request,'recruit/annexure/annexure_r.djt',response)

@login_required(login_url='/register')
def annexure_s(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_S.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_s')
            annexure.last_prom = request.POST['last_prom']
            annexure.store = True
            annexure.extra_load = float(request.POST.get('extra_load',0));
            annexure.credit_score = float(request.POST.get('credit',0));
            annexure.avg_load = float(request.POST.get('avg_load',0));
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_S()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_s']
            annexure.last_prom = request.POST['last_prom']
            annexure.extra_load = float(request.POST.get('extra_load',0));
            annexure.credit_score = float(request.POST.get('credit',0));
            annexure.avg_load = float(request.POST.get('avg_load',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_s = Acad_Annex_S.objects.filter(app_id=app_data)
    if annex_s.count() > 0:
        if annex_s[0].annexure_data:
            response['annex_s'] = json.loads(annex_s[0].annexure_data)
            response['last_prom'] = annex_s[0].last_prom
            response['extra_load'] = annex_s[0].extra_load
            response['credit'] = annex_s[0].credit_score
            response['avg_load'] = annex_s[0].avg_load
            response['annexure_file'] = annex_s[0].annexure_file
    return render(request,'recruit/annexure/annexure_s.djt',response)

def getValue(request, annexure, str):
    if(len(request.POST[str])>2):
        oldstr = (annexure.annexure_data)
	#oldstr = unicodedata.normalize("NFKD",oldstr)
        #print(oldstr)
        newstr = (request.POST[str])
	#newstr = unicodedata.normalize("NFKD",newstr)
	#print(newstr)
        if oldstr == " " or oldstr == "[]" or oldstr == '[]':
            return ("[" + newstr[1:])
        else:
            return (oldstr[:-1] + "," + newstr[1:])
        return (oldstr[:-1] + "," + newstr[1:])
    return " "

def getJsonStringVal(oldstr,newstr):
    if(len(oldstr)>2) :
        return oldstr[:-1] + "," + newstr[1:]
    else :
        return newstr

@login_required(login_url='/register')
def annexure_t(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        try:
            annexure = Acad_Annex_T.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_t')
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_T()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_t']
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_t = Acad_Annex_T.objects.filter(app_id=app_data)
    if annex_t.count() > 0:
        if annex_t[0].annexure_data:
            response['annex_t'] = json.loads(annex_t[0].annexure_data)
            response['last_prom'] = annex_t[0].last_prom
            response['total'] = annex_t[0].total
            response['annexure_file'] = annex_t[0].annexure_file
    return render(request,'recruit/annexure/annexure_t.djt',response)

@login_required(login_url='/register')
def annexure_u(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_U.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_u')
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_U()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_u']
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_u = Acad_Annex_U.objects.filter(app_id=app_data)
    if annex_u.count() > 0:
        if annex_u[0].annexure_data:
            response['annex_u'] = json.loads(annex_u[0].annexure_data)
            response['last_prom'] = annex_u[0].last_prom
            response['total'] = annex_u[0].total
            response['annexure_file'] = annex_u[0].annexure_file
    return render(request,'recruit/annexure/annexure_u.djt',response)

@login_required(login_url='/register')
def annexure_v(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_V.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_v')
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_V()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_v']
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_v = Acad_Annex_V.objects.filter(app_id=app_data)
    if annex_v.count() > 0:
        if annex_v[0].annexure_data:
            response['annex_v'] = json.loads(annex_v[0].annexure_data)
            response['last_prom'] = annex_v[0].last_prom
            response['total'] = annex_v[0].total
            response['annexure_file'] = annex_v[0].annexure_file
    return render(request,'recruit/annexure/annexure_v.djt',response)

@login_required(login_url='/register')
def annexure_w1(request) :
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_W1_W2.objects.get(app_id=app_data)
            if len(request.POST['annexure_w1'])>2:
                oldstr = annexure.annexure_data1
                newstr = request.POST['annexure_w1']
                if oldstr == " " or oldstr == "[]":
                    annexure.annexure_data1 = "[" + newstr[1:]
                else:
                    annexure.annexure_data1 = oldstr[:-1] + "," + newstr[1:]
            annexure.last_prom_w1 = request.POST['last_prom']
            annexure.total_w1 = float(request.POST.get('total_w1',0));
            annexure.store_w1 = True
            if request.FILES:
                annexure.annexure_file_w1 = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_W1_W2()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data1 = request.POST['annexure_w1']
            annexure.last_prom_w1 = request.POST['last_prom']
            annexure.total_w1 = annexure.total_w1+float(request.POST.get('total_w1',0));
            annexure.store_w1 = True
            if request.FILES:
                annexure.annexure_file_w1 = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_w1 = Acad_Annex_W1_W2.objects.filter(app_id=app_data)
    if annex_w1.count() > 0:
        if len(str((annex_w1[0].annexure_data1).encode("utf-8"))) > 1:
            response['annex_w1'] = json.loads(annex_w1[0].annexure_data1)
            response['last_prom'] = annex_w1[0].last_prom_w1
            response['total_w1'] = annex_w1[0].total_w1
            response['annexure_file'] = annex_w1[0].annexure_file_w1
    return render(request,'recruit/annexure/annexure_w1.djt',response)

@login_required(login_url='/register')
def annexure_w2(request):
    app_data = Appdata.objects.get(user = request.user)
    response = {}
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_W1_W2.objects.get(app_id=app_data)
            if len(request.POST['annexure_w2'])>2:
                oldstr = annexure.annexure_data2
                newstr = request.POST['annexure_w2']
                if oldstr == " " or oldstr == "[]":
                    annexure.annexure_data2 = "[" + newstr[1:]
                else:
                    annexure.annexure_data2 = oldstr[:-1] + "," + newstr[1:]
            annexure.last_prom_w2 = request.POST['last_prom']
            annexure.total_w2 = float(request.POST.get('total_w2',0));
            annexure.store_w2 = True
            if request.FILES:
                annexure.annexure_file_w2 = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_W1_W2()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data2 = request.POST['annexure_w2']
            annexure.last_prom_w2 = request.POST['last_prom']
            annexure.total_w2 = annexure.total_w2+float(request.POST.get('total_w2',0));
            annexure.store_w2 = True
            if request.FILES:
                annexure.annexure_file_w2 = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_w2 = Acad_Annex_W1_W2.objects.filter(app_id=app_data)
    if annex_w2.count() > 0:
        if len(str((annex_w2[0].annexure_data2).encode("utf-8"))) > 1:
            response['annex_w2'] = json.loads(annex_w2[0].annexure_data2)
            response['last_prom'] = annex_w2[0].last_prom_w2
            response['total_w2'] = annex_w2[0].total_w2
            response['annexure_file'] = annex_w2[0].annexure_file_w2
    return render(request,'recruit/annexure/annexure_w2.djt',response)

@login_required(login_url='/register')
def annexure_x(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    print app_data
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_X.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_x')
            annexure.last_prom = request.POST['last_prom']
            annexure.total = float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_X()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_x']
            annexure.last_prom = request.POST['last_prom']
            annexure.total = annexure.total+float(request.POST.get('total',0));
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_x = Acad_Annex_X.objects.filter(app_id=app_data)
    if annex_x.count() > 0:
        if len(str((annex_x[0].annexure_data).encode("utf-8"))) > 1:
            response['annex_x'] = json.loads(annex_x[0].annexure_data)
            response['last_prom'] = annex_x[0].last_prom
            response['annexure_file'] = annex_x[0].annexure_file
            response['total'] = annex_x[0].total
    return render(request,'recruit/annexure/annexure_x.djt',response)

@login_required(login_url='/register')
def annexure_y(request):
    app_data = Appdata.objects.get(user = request.user)
    result = {}
    if request.POST:
        print request.POST
        result['ieee'] = False
        result['fna'] = False
        result['fnae']=False
        result['fnasc'] = False
        for key in request.POST:
            if(key == 'csrfmiddlewaretoken' or key == 'credit'):
                continue
            value = request.POST[key]
            if(len(value)>0):
                result[str(value)] = True
                print value
        try:
            annexure = Acad_Annex_Y.objects.get(app_id=app_data)
            annexure.annexure_data = result
            annexure.store = True
            annexure.credit_score = float(request.POST.get('credit',0))
            annexure.ieee = result['ieee']
            annexure.fna = result['fna']
            annexure.fnae = result['fnae']
            annexure.fnasc = result['fnasc']
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_Y()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.ieee = result['ieee']
            annexure.fna = result['fna']
            annexure.fnae = result['fnae']
            annexure.fnasc = result['fnasc']
            annexure.credit_score = float(request.POST.get('credit',0))
            annexure.store = True
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_y = Acad_Annex_Y.objects.filter(app_id=app_data)
    response = {}
    if annex_y.count() > 0:
        response['credit'] = annex_y[0].credit_score
        response['ieee'] = annex_y[0].ieee 
        response['fna'] = annex_y[0].fna 
        response['fnae'] = annex_y[0].fnae 
        response['fnasc'] = annex_y[0].fnasc 
        response['annexure_file'] = annex_y[0].annexure_file
    return render(request,'recruit/annexure/annexure_y.djt',response)

@login_required(login_url='/register')
def annexure_z(request):
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    if(request.POST):
        print request.POST
        try:
            annexure = Acad_Annex_Z.objects.get(app_id=app_data)
            annexure.annexure_data = getValue(request, annexure, 'annexure_z')
            annexure.store = True
            annexure.total = float(request.POST.get('total',0));
            annexure.last_prom=request.POST['last_prom']
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        except ObjectDoesNotExist:
            annexure = Acad_Annex_Z()
            annexure.app_id = Appdata.objects.get(app_id = app_data)
            annexure.annexure_data = request.POST['annexure_z']
            annexure.store = True
            annexure.total = annexure.total+float(request.POST.get('total',0));
            annexure.last_prom=request.POST['last_prom']
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()
        return redirect('academic/')
    annex_z = Acad_Annex_Z.objects.filter(app_id=app_data)
    if annex_z.count() > 0:
        if len(str((annex_z[0].annexure_data).encode("utf-8"))) > 1:
            response['annex_z'] = json.loads(annex_z[0].annexure_data)
            response['last_prom'] = annex_z[0].last_prom
            response['annexure_file'] = annex_z[0].annexure_file
            response['total'] = annex_z[0].total
    return render(request,'recruit/annexure/annexure_z.djt',response)

@login_required(login_url='/register')
def subject_ref(request):
    response = {}
    app_id = Appdata.objects.get(user=request.user)
    if app_id.submitted :
        return redirect('/printSummary')
    response['app'] = app_id

    if request.method == 'POST' :

        if not SubjectTaught.objects.filter(app_id=app_id,level='UG',courseType='core').exists() :
            coreUG = SubjectTaught()
            coreUG.app_id = app_id
            coreUG.level = 'UG'
            coreUG.courseType = 'core'
            coreUG.data = request.POST['coreUGdata']
        else :
            coreUG = SubjectTaught.objects.get(app_id=app_id,level='UG',courseType='core')
            if len(request.POST.get('coreUGdata'))>2 :
                oldstr = coreUG.data
                newstr = request.POST['coreUGdata']
                coreUG.data = getJsonStringVal(oldstr,newstr)
        coreUG.save()

        if not SubjectTaught.objects.filter(app_id=app_id,level='UG',courseType='elective').exists() :
            electiveUG = SubjectTaught()
            electiveUG.app_id = app_id
            electiveUG.level = 'UG'
            electiveUG.courseType = 'elective'
            electiveUG.data = request.POST['electiveUGdata']
        else :
            electiveUG = SubjectTaught.objects.get(app_id=app_id,level='UG',courseType='elective')
            if len(request.POST.get('electiveUGdata'))>2:
                oldstr2 = electiveUG.data
                newstr2 = request.POST['electiveUGdata']
                electiveUG.data = getJsonStringVal(oldstr2,newstr2)
        electiveUG.save()

        if not SubjectTaught.objects.filter(app_id=app_id,level='PG',courseType='core').exists() :
            corePG = SubjectTaught()
            corePG.app_id = app_id
            corePG.level = 'PG'
            corePG.courseType = 'core'
            corePG.data = request.POST['corePGdata']
        else :
            corePG = SubjectTaught.objects.get(app_id=app_id,level='PG',courseType='core')
            if len(request.POST['corePGdata'])>2 :
                oldstr3 = corePG.data
                newstr3 = request.POST['corePGdata']
                corePG.data = getJsonStringVal(oldstr3,newstr3)
        corePG.save()

        if not SubjectTaught.objects.filter(app_id=app_id,level='PG',courseType='elective').exists() :
            electivePG = SubjectTaught()
            electivePG.app_id = app_id
            electivePG.level = 'PG'
            electivePG.courseType = 'elective'
            electivePG.data = request.POST['electivePGdata']
        else :
            electivePG = SubjectTaught.objects.get(app_id=app_id,level='PG',courseType='elective')
            if len(request.POST['electivePGdata'])>2 :
                oldstr4 = electivePG.data
                newstr4 = request.POST['electivePGdata']
                electivePG.data = getJsonStringVal(oldstr4,newstr4)
        electivePG.save()

        if not Referral.objects.filter(app_id=app_id).exists() :
            refobj = Referral()
            refobj.app_id = app_id
            refobj.ref_data = request.POST['refFinaldata']
        else :
            refobj = Referral.objects.get(app_id=app_id)
            if len(request.POST['refFinaldata'])>2 :
                oldstr = refobj.ref_data
                newstr = request.POST['refFinaldata']
                refobj.ref_data = getJsonStringVal(oldstr,newstr)
        refobj.save()

    if SubjectTaught.objects.filter(app_id=app_id,level='UG',courseType='core').exists() :
        obj1 = SubjectTaught.objects.get(app_id=app_id,level='UG',courseType='core')
        response['coreUGobj'] = json.loads(obj1.data)
    if SubjectTaught.objects.filter(app_id=app_id,level='UG',courseType='elective').exists() :
        obj2 = SubjectTaught.objects.get(app_id=app_id,level='UG',courseType='elective')
        response['electiveUGobj'] = json.loads(obj2.data)
    if SubjectTaught.objects.filter(app_id=app_id,level='PG',courseType='core').exists() :
        obj3 = SubjectTaught.objects.get(app_id=app_id,level='PG',courseType='core')
        response['corePGobj'] = json.loads(obj3.data)
    if SubjectTaught.objects.filter(app_id=app_id,level='PG',courseType='elective').exists() :
        obj4 = SubjectTaught.objects.get(app_id=app_id,level='PG',courseType='elective')
        response['electivePGobj'] = json.loads(obj4.data)
    if Referral.objects.filter(app_id=app_id).exists() :
        obj5 = Referral.objects.get(app_id=app_id)
        response['refobjs'] = json.loads(obj5.ref_data)

    return render(request,'recruit/subject_ref.djt',response)

@login_required(login_url='/register')
def printSummary(request):
    response = {}
    return render(request,'recruit/summary.djt',response)

@login_required(login_url='/register')
def print_main_application(request):
    response = {}
    response['profile'] = UserProfile.objects.get(user = request.user)
    app_id = Appdata.objects.get(user=request.user)
    response['specialization'] = app_id.specialize
    if FacUser.objects.filter(app_id=app_id).exists():
        response['generalData'] = FacUser.objects.get(app_id=app_id)
    if Experience.objects.filter(app_id=app_id).exists():
        exp = Experience.objects.get(app_id=app_id)
        response['Experience'] = exp
        response['teachingData'] = json.loads(exp.teaching_data)
        response['researchData'] = json.loads(exp.research_data)
        response['industryData'] = json.loads(exp.industrial_data)

    if Qualification.objects.filter(app_id=app_id,degreeType='UG').exists():
        response['Bqual'] = Qualification.objects.get(app_id=app_id,degreeType='UG')
    if Qualification.objects.filter(app_id=app_id,degreeType='PG').exists():
        response['Mqual'] = Qualification.objects.get(app_id=app_id,degreeType='PG')
    if Qualification.objects.filter(app_id=app_id,degreeType='PHD').exists():
        response['Phdqual'] = Qualification.objects.get(app_id=app_id,degreeType='PHD')
    if Qualification.objects.filter(app_id=app_id,degreeType='other').exists():
        response['Oqual'] = Qualification.objects.get(app_id=app_id,degreeType='other')

    external_sponsored_rnd = External_Sponsored_RnD.objects.filter(app_id=app_id)
    consultancy_projects = Consultancy_Projects.objects.filter(app_id=app_id)
    phd_completed = PhD_Completed.objects.filter(app_id=app_id)
    journal_papers = Journal_Papers.objects.filter(app_id = app_id)
    conference_paper_sci = Conference_Paper_SCI.objects.filter(app_id = app_id)


    acad_annex_a = Acad_Annex_A.objects.filter(app_id=app_id)
    acad_annex_b = Acad_Annex_B.objects.filter(app_id=app_id)
    acad_annex_c = Acad_Annex_C.objects.filter(app_id=app_id)
    acad_annex_d = Acad_Annex_D.objects.filter(app_id=app_id)
    acad_annex_e12 = Acad_Annex_E12.objects.filter(app_id=app_id)
    acad_annex_f = Acad_Annex_F.objects.filter(app_id=app_id)
    acad_annex_g = Acad_Annex_G.objects.filter(app_id=app_id)
    acad_annex_h = Acad_Annex_H.objects.filter(app_id=app_id)
    acad_annex_i = Acad_Annex_I.objects.filter(app_id=app_id)
    acad_annex_j = Acad_Annex_J.objects.filter(app_id=app_id)
    acad_annex_k = Acad_Annex_K.objects.filter(app_id=app_id)
    acad_annex_l = Acad_Annex_L.objects.filter(app_id=app_id)
    acad_annex_m = Acad_Annex_M.objects.filter(app_id=app_id)
    acad_annex_n = Acad_Annex_N.objects.filter(app_id=app_id)
    acad_annex_o = Acad_Annex_O.objects.filter(app_id=app_id)
    acad_annex_p = Acad_Annex_P.objects.filter(app_id=app_id)
    acad_annex_q = Acad_Annex_Q.objects.filter(app_id=app_id)
    acad_annex_r = Acad_Annex_R.objects.filter(app_id=app_id)
    acad_annex_s = Acad_Annex_S.objects.filter(app_id=app_id)
    acad_annex_t = Acad_Annex_T.objects.filter(app_id=app_id)
    acad_annex_u = Acad_Annex_U.objects.filter(app_id=app_id)
    acad_annex_v = Acad_Annex_V.objects.filter(app_id=app_id)
    acad_annex_w1_w2 = Acad_Annex_W1_W2.objects.filter(app_id=app_id)
    acad_annex_x = Acad_Annex_X.objects.filter(app_id=app_id)
    acad_annex_y = Acad_Annex_Y.objects.filter(app_id=app_id)
    acad_annex_z = Acad_Annex_Z.objects.filter(app_id=app_id)

    if external_sponsored_rnd.count() > 0:
        response['external_sponsored_rnd'] = external_sponsored_rnd[0]
        if external_sponsored_rnd[0].projects_not_pi:
            response['projects_not_pi'] = json.loads(external_sponsored_rnd[0].projects_not_pi)
        if external_sponsored_rnd[0].patents_not_pi:
            response['patents_not_pi'] = json.loads(external_sponsored_rnd[0].patents_not_pi)

    if consultancy_projects.count() > 0:
        response['consultancy_projects'] = consultancy_projects[0]

    if phd_completed.count() > 0:
        response['phd_completed'] = phd_completed[0]
        if phd_completed[0].phds:
            response['phds'] = json.loads(phd_completed[0].phds)
        response['phds'] = json.loads(phd_completed[0].phds)

    if journal_papers.count() > 0:
        response['journal_papers'] = journal_papers[0]
        if journal_papers[0].papers:
            response['papers'] = json.loads(journal_papers[0].papers)
        response['papers'] = json.loads(journal_papers[0].papers)

    if conference_paper_sci.count() > 0:
        response['conference_paper_sci'] = conference_paper_sci[0]
        if conference_paper_sci[0].papers:
            response['papers1'] = json.loads(conference_paper_sci[0].papers)
        response['papers1'] = json.loads(conference_paper_sci[0].papers)


    if acad_annex_a.count() > 0:
        response['acad_annex_a'] = acad_annex_a[0]

    if acad_annex_b.count() > 0:
        response['acad_annex_b'] = acad_annex_b[0]
    if acad_annex_c.count() > 0:
        response['acad_annex_c'] = acad_annex_c[0]

    if acad_annex_d.count() > 0:
        response['acad_annex_d'] = acad_annex_d[0]

    if acad_annex_e12.count() > 0:
        response['acad_annex_e12'] = acad_annex_e12[0]
        response['total_e'] = float(acad_annex_e12[0].total_e1 + acad_annex_e12[0].total_e2)

    if acad_annex_f.count() > 0:
        response['acad_annex_f'] = acad_annex_f[0]

    if acad_annex_g.count() > 0:
        response['acad_annex_g'] = acad_annex_g[0]

    if acad_annex_h.count() > 0:
        response['acad_annex_h'] = acad_annex_h[0]

    if acad_annex_i.count() > 0:
        response['acad_annex_i'] = acad_annex_i[0]

    if acad_annex_j.count() > 0:
        response['acad_annex_j'] = acad_annex_j[0]

    if acad_annex_k.count() > 0:
        response['acad_annex_k'] = acad_annex_k[0]

    if acad_annex_l.count() > 0:
        response['acad_annex_l'] = acad_annex_l[0]

    if acad_annex_m.count() > 0:
        response['acad_annex_m'] = acad_annex_m[0]

    if acad_annex_n.count() > 0:
        response['acad_annex_n'] = acad_annex_n[0]

    if acad_annex_o.count() > 0:
        response['acad_annex_o'] = acad_annex_o[0]

    if acad_annex_p.count() > 0:
        response['acad_annex_p'] = acad_annex_p[0]

    if acad_annex_q.count() > 0:
        response['acad_annex_q'] = acad_annex_q[0]  

    if acad_annex_r.count() > 0:
        response['acad_annex_r'] = acad_annex_r[0]

    if acad_annex_s.count() > 0:
        response['acad_annex_s'] = acad_annex_s[0]

    if acad_annex_t.count() > 0:
        response['acad_annex_t'] = acad_annex_t[0]

    if acad_annex_u.count() > 0:
        response['acad_annex_u'] = acad_annex_u[0]

    if acad_annex_v.count() > 0:
        response['acad_annex_v'] = acad_annex_v[0]

    if acad_annex_w1_w2.count() > 0:
        response['acad_annex_w1_w2'] = acad_annex_w1_w2[0]
        response['total_w'] = float(acad_annex_w1_w2[0].total_w1 + acad_annex_w1_w2[0].total_w2)

    if acad_annex_x.count() > 0:
        response['acad_annex_x'] = acad_annex_x[0]

    if acad_annex_y.count() > 0:
        response['acad_annex_y'] = acad_annex_y[0]

    if acad_annex_z.count() > 0:
        response['acad_annex_z'] = acad_annex_z[0]

    if SubjectTaught.objects.filter(app_id=app_id,level='UG',courseType='core').exists() :
        obj1 = SubjectTaught.objects.get(app_id=app_id,level='UG',courseType='core')
        response['coreUGobj'] = json.loads(obj1.data)
    if SubjectTaught.objects.filter(app_id=app_id,level='UG',courseType='elective').exists() :
        obj2 = SubjectTaught.objects.get(app_id=app_id,level='UG',courseType='elective')
        response['electiveUGobj'] = json.loads(obj2.data)
    if SubjectTaught.objects.filter(app_id=app_id,level='PG',courseType='core').exists() :
        obj3 = SubjectTaught.objects.get(app_id=app_id,level='PG',courseType='core')
        response['corePGobj'] = json.loads(obj3.data)
    if SubjectTaught.objects.filter(app_id=app_id,level='PG',courseType='elective').exists() :
        obj4 = SubjectTaught.objects.get(app_id=app_id,level='PG',courseType='elective')
        response['electivePGobj'] = json.loads(obj4.data)
    if Referral.objects.filter(app_id=app_id).exists() :
        obj5 = Referral.objects.get(app_id=app_id)
        response['refobjs'] = json.loads(obj5.ref_data)
    
    return render(request, 'recruit/print_main_application.djt', response)

@login_required(login_url='/register')
def print_annexures(request):
    response = {}
    response['profile'] = UserProfile.objects.get(user = request.user)
    app_id = Appdata.objects.get(user=request.user)
    response['specialization'] = app_id.specialize

    annex_e1 = Acad_Annex_E12.objects.filter(app_id=app_id)
    if annex_e1.count() > 0:
        if len(str((annex_e1[0].annexure_data_e1).encode("utf-8"))) > 1:
            response['annex_e1'] = json.loads(annex_e1[0].annexure_data_e1)

    annex_e2 = Acad_Annex_E12.objects.filter(app_id=app_id)
    if annex_e2.count() > 0:
        if len(str((annex_e2[0].annexure_data_e2).encode("utf-8"))) > 1:
            response['annex_e2'] = json.loads(annex_e2[0].annexure_data_e2)

    annex_f = Acad_Annex_F.objects.filter(app_id=app_id)
    if annex_f.count() > 0:
        if annex_f[0].annexure_data:
            response['annex_f'] = json.loads(annex_f[0].annexure_data)
            response['annex_f_credit'] = annex_f[0].credit_score

    annex_g = Acad_Annex_G.objects.filter(app_id=app_id)
    if annex_g.count() > 0:
        if annex_g[0].annexure_data:
            response['annex_g'] = json.loads(annex_g[0].annexure_data)

    annex_h = Acad_Annex_H.objects.filter(app_id=app_id)
    if annex_h.count() > 0:
        if annex_h[0].annexure_data:
            response['annex_h'] = json.loads(annex_h[0].annexure_data)
            response['annex_h_last_prom'] = annex_h[0].last_prom

    annex_i = Acad_Annex_I.objects.filter(app_id=app_id)
    if annex_i.count() > 0:
        if annex_i[0].annexure_data:
            response['annex_i'] = json.loads(annex_i[0].annexure_data)

    annex_j = Acad_Annex_J.objects.filter(app_id=app_id)
    if annex_j.count() > 0:
        if annex_j[0].annexure_data:
            response['annex_j'] = json.loads(annex_j[0].annexure_data)
            response['annex_j_credit'] = annex_j[0].credit_score
            response['annex_j_last_prom'] = annex_j[0].last_prom

    annex_k = Acad_Annex_K.objects.filter(app_id=app_id)
    if annex_k.count() > 0:
        if annex_k[0].annexure_data:
            response['annex_k'] = json.loads(annex_k[0].annexure_data)
            response['annex_k_credit'] = annex_k[0].credit_score
            response['annex_k_last_prom'] = annex_k[0].last_prom

    annex_l = Acad_Annex_L.objects.filter(app_id=app_id)
    if annex_l.count() > 0:
        if annex_l[0].annexure_data:
            response['annex_l'] = json.loads(annex_l[0].annexure_data)
            response['annex_l_last_prom'] = annex_l[0].last_prom
            response['annex_l_credit'] = annex_l[0].credit_score

    annex_m = Acad_Annex_M.objects.filter(app_id=app_id)
    if annex_m.count() > 0:
        if annex_m[0].annexure_data:
            response['annex_m'] = json.loads(annex_m[0].annexure_data)
            response['annex_m_credit'] = annex_m[0].credit_score
            response['annex_m_last_prom'] = annex_m[0].last_prom

    annex_n = Acad_Annex_N.objects.filter(app_id=app_id)
    if annex_n.count() > 0:
        if annex_n[0].annexure_data:
            response['annex_n'] = json.loads(annex_n[0].annexure_data)
            response['annex_n_last_prom'] = annex_n[0].last_prom

    annex_o = Acad_Annex_O.objects.filter(app_id=app_id)
    if annex_o.count() > 0:
        if annex_o[0].annexure_data:
            response['annex_o'] = json.loads(annex_o[0].annexure_data)
            response['annex_o_last_prom'] = annex_o[0].last_prom

    annex_p = Acad_Annex_P.objects.filter(app_id=app_id)
    if annex_p.count() > 0:
        if annex_p[0].annexure_data:
            response['annex_p'] = json.loads(annex_p[0].annexure_data)
            response['annex_p_last_prom'] = annex_p[0].last_prom

    annex_q = Acad_Annex_Q.objects.filter(app_id=app_id)
    if annex_q.count() > 0:
        if annex_q[0].annexure_data:
            response['annex_q'] = json.loads(annex_q[0].annexure_data)
            response['annex_q_last_prom'] = annex_q[0].last_prom
            response['annex_q_exp_phd'] = annex_q[0].total_exp_after_phd
            response['annex_q_exp_cur'] = annex_q[0].total_exp_cur
            response['annex_q_tot_exp'] = annex_q[0].total_exp
            response['annex_q_credit'] = annex_q[0].credit_score

    annex_r = Acad_Annex_R.objects.filter(app_id=app_id)
    if annex_r.count() > 0:
        if annex_r[0].annexure_data:
            response['annex_r'] = json.loads(annex_r[0].annexure_data)
            response['annex_r_last_prom'] = annex_r[0].last_prom

    annex_s = Acad_Annex_S.objects.filter(app_id=app_id)
    if annex_s.count() > 0:
        if annex_s[0].annexure_data:
            response['annex_s'] = json.loads(annex_s[0].annexure_data)
            response['annex_s_last_prom'] = annex_s[0].last_prom
            response['annex_s_extra_load'] = annex_s[0].extra_load
            response['annex_s_credit'] = annex_s[0].credit_score

    annex_t = Acad_Annex_T.objects.filter(app_id=app_id)
    if annex_t.count() > 0:
        if annex_t[0].annexure_data:
            response['annex_t'] = json.loads(annex_t[0].annexure_data)
            response['annex_t_last_prom'] = annex_t[0].last_prom

    annex_u = Acad_Annex_U.objects.filter(app_id=app_id)
    if annex_u.count() > 0:
        if annex_u[0].annexure_data:
            response['annex_u'] = json.loads(annex_u[0].annexure_data)
            response['annex_u_last_prom'] = annex_u[0].last_prom

    annex_v = Acad_Annex_V.objects.filter(app_id=app_id)
    if annex_v.count() > 0:
        if annex_v[0].annexure_data:
            response['annex_v'] = json.loads(annex_v[0].annexure_data)
            response['annex_v_last_prom'] = annex_v[0].last_prom
    
    annex_w1 = Acad_Annex_W1_W2.objects.filter(app_id=app_id)
    if annex_w1.count() > 0:
        if len(str((annex_w1[0].annexure_data1).encode("utf-8"))) > 1:
            response['annex_w1'] = json.loads(annex_w1[0].annexure_data1)
            response['annex_w1_last_prom'] = annex_w1[0].last_prom_w1

    annex_w2 = Acad_Annex_W1_W2.objects.filter(app_id=app_id)
    if annex_w2.count() > 0:
        if len(str((annex_w2[0].annexure_data2).encode("utf-8"))) > 1:
            response['annex_w2'] = json.loads(annex_w2[0].annexure_data2)
            response['annex_w2_last_prom'] = annex_w2[0].last_prom_w2

    annex_x = Acad_Annex_X.objects.filter(app_id=app_id)
    if annex_x.count() > 0:
        if len(str((annex_x[0].annexure_data).encode("utf-8"))) > 1:
            response['annex_x'] = json.loads(annex_x[0].annexure_data)
            response['annex_x_last_prom'] = annex_x[0].last_prom

    annex_y = Acad_Annex_Y.objects.filter(app_id=app_id)
    if annex_y.count() > 0:
        response['annex_y_credit'] = annex_y[0].credit_score
        response['annex_y_ieee'] = annex_y[0].ieee 
        response['annex_y_fna'] = annex_y[0].fna 
        response['annex_y_fnae'] = annex_y[0].fnae 
        response['annex_y_fnasc'] = annex_y[0].fnasc 

    annex_z = Acad_Annex_Z.objects.filter(app_id=app_id)
    if annex_z.count() > 0:
        if len(str((annex_z[0].annexure_data).encode("utf-8"))) > 1:
            response['annex_z'] = json.loads(annex_z[0].annexure_data)
            response['annex_z_last_prom'] = annex_z[0].last_prom

    annex_a = Acad_Annex_A.objects.filter(app_id=app_id)
    if annex_a.count() > 0:
        if len(str((annex_a[0].annexure_data).encode("utf-8"))) > 1:
            response['annex_a'] = json.loads(annex_a[0].annexure_data)

    return render(request, 'recruit/print_annexures.djt', response)

def uploadPaper(request,papernum=0) :
    response = {}
    app_id = Appdata.objects.get(user=request.user)

    if Paper.objects.filter(app_id=app_id).exists() :
        obj = Paper.objects.get(app_id=app_id)
    else :
        obj = Paper()
        obj.app_id = app_id
        obj.save()

    if request.method == 'POST' :
        if papernum=='1' :
            obj.paper1 = request.FILES['paper1']
            if validateFormat(obj.paper1) :
                obj.save()
            else : 
                return HttpResponse('Only Pdf format is allowed')
        if papernum=='2' :
            obj.paper2 = request.FILES['paper2']
            if validateFormat(obj.paper2) :
                obj.save()
            else : 
                return HttpResponse('Only Pdf format is allowed')
        if papernum=='3' :
            obj.paper3 = request.FILES['paper3']
            if validateFormat(obj.paper3) :
                obj.save()
            else : 
                return HttpResponse('Only Pdf format is allowed')
        if papernum=='4' :
            obj.paper4 = request.FILES['paper4']
            if validateFormat(obj.paper5) :
                obj.save()
            else : 
                return HttpResponse('Only Pdf format is allowed')
        if papernum=='5' :
            obj.paper5 = request.FILES['paper5']
            if validateFormat(obj.paper5) :
                obj.save()
            else : 
                return HttpResponse('Only Pdf format is allowed')
        if papernum=='6' :
            obj.cvpaper = request.FILES['cvpaper']
            if validateFormat(obj.cvpaper) :
                obj.save()
            else : 
                return HttpResponse('Only Pdf format is allowed')
        return redirect('/uploadPaper/0')

    response['obj'] = obj
    return render(request,'recruit/upload_docs.djt',response)

def lockApplication(request) :
    response = {}
    app = Appdata.objects.get(user=request.user)
    app.submitted = True
    app.submitDate = datetime.datetime.now()
    app.save()

    mailid = request.user.email

    receiver = mailid
    sender = 'nitap_recruitment17@nitw.ac.in'
    content = 'Your Application for the post of '+app.post_for
    content = content + ' in '+app.post_in+' has been submitted on '
    content = content + app.submitDate.strftime('%Y-%m-%d %H:%M')
    rlist = []
    rlist.append(receiver)
    subject = 'Acknowlegement for Submission of Application'
    print (mailid+" : "+content)
    try:
        send_mail(subject,content,sender,rlist,fail_silently=False,)
    except BadHeaderError:
        return HttpResponse('Invalid header found.')

    return redirect('/subject_ref')

def printAck(request):
    response = {}
    app = Appdata.objects.get(user=request.user)
    response['facuser'] = FacUser.objects.get(app_id=app)
    response['app'] = app
    return render(request,'recruit/printAck.djt',response)

def validateFormat(filename):
    ext = os.path.splitext(filename.name)[1]
    valid_extentions = ['.pdf']
    if not ext in valid_extentions:
        return False
    return True

def calculate_age(dob):
    born = datetime.datetime.strptime(dob, "%Y-%m-%d")
    today = datetime.date.today()
    return today.year - born.year - ((today.month, today.day) < (born.month, born.day))

def refresh(request,annexName) :
    response = {}
    app_data = Appdata.objects.get(user = request.user)
    if annexName == 'e_1' :
        if Acad_Annex_E12.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_E12.objects.get(app_id=app_data)
            annexure.store_e1 = False
            annexure.total_e1 = 0
            annexure.annexure_data_e1 = '[]'
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()

    if annexName == 'e2' :
        if Acad_Annex_E12.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_E12.objects.get(app_id=app_data)
            annexure.store_e2 = False
            annexure.total_e2 = 0
            annexure.annexure_data_e2 = '[]'
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()

    if annexName == 'f' :
        if Acad_Annex_F.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_F.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'g' :
        if Acad_Annex_G.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_G.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'h' :
        if Acad_Annex_H.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_H.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'i' :
        if Acad_Annex_I.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_I.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'j' :
        if Acad_Annex_J.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_J.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'k' :
        if Acad_Annex_K.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_K.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'l' :
        if Acad_Annex_L.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_L.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'm' :
        if Acad_Annex_M.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_M.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'n' :
        if Acad_Annex_N.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_N.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'o' :
        if Acad_Annex_O.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_O.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'p' :
        if Acad_Annex_P.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_P.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'q' :
        if Acad_Annex_Q.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_Q.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'r' :
        if Acad_Annex_R.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_R.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 's' :
        if Acad_Annex_S.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_S.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 't' :
        if Acad_Annex_T.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_T.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'u' :
        if Acad_Annex_U.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_U.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'v' :
        if Acad_Annex_V.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_V.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'w1' :
        if Acad_Annex_W1_W2.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_W1_W2.objects.objects.get(app_id=app_data)
            annexure.annexure_data1 = '[]'
            annexure.last_prom_w1 = ''
            annexure.total_w1 = 0
            annexure.store_w1 = False
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()

    if annexName == 'w2' :
        if Acad_Annex_W1_W2.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_W1_W2.objects.objects.get(app_id=app_data)
            annexure.annexure_data2 = '[]'
            annexure.last_prom_w2 = ''
            annexure.total_w2 = 0
            annexure.store_w2 = False
            if request.FILES:
                annexure.annexure_file = request.FILES['annexure_file']
            annexure.save()

    if annexName == 'x' :
        if Acad_Annex_X.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_X.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'y' :
        if Acad_Annex_Y.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_Y.objects.get(app_id=app_data)
            annexure.delete()

    if annexName == 'z' :
        if Acad_Annex_Z.objects.filter(app_id=app_data).exists() :
            annexure = Acad_Annex_Z.objects.get(app_id=app_data)
            annexure.delete()

    return redirect('/academic/annexure_'+annexName)

def uploadExpDoc(request) :
    response = {}
    app_id = Appdata.objects.get(user=request.user)

    if Paper.objects.filter(app_id=app_id).exists() :
        obj = Paper.objects.get(app_id=app_id)
    else :
        obj = Paper()
        obj.app_id = app_id
        obj.save()

    if request.method == 'POST' :
        obj.paper1 = request.FILES['paper1']
        if validateFormat(obj.paper1) :
            obj.save()
        else : 
            return HttpResponse('Only Pdf format is allowed')
        return redirect('/uploadExpDoc')

    response['obj'] = obj
    return render(request,'recruit/uploadExpDocs.djt',response)

def all_annexures(request) :
    response = {}
    app_id = Appdata.objects.get(user=request.user)
    response['profile'] = UserProfile.objects.get(user = request.user)
    acad_annex_a = Acad_Annex_A.objects.filter(app_id=app_id)
    acad_annex_b = Acad_Annex_B.objects.filter(app_id=app_id)
    acad_annex_c = Acad_Annex_C.objects.filter(app_id=app_id)
    acad_annex_d = Acad_Annex_D.objects.filter(app_id=app_id)
    acad_annex_e12 = Acad_Annex_E12.objects.filter(app_id=app_id)
    acad_annex_f = Acad_Annex_F.objects.filter(app_id=app_id)
    acad_annex_g = Acad_Annex_G.objects.filter(app_id=app_id)
    acad_annex_h = Acad_Annex_H.objects.filter(app_id=app_id)
    acad_annex_i = Acad_Annex_I.objects.filter(app_id=app_id)
    acad_annex_j = Acad_Annex_J.objects.filter(app_id=app_id)
    acad_annex_k = Acad_Annex_K.objects.filter(app_id=app_id)
    acad_annex_l = Acad_Annex_L.objects.filter(app_id=app_id)
    acad_annex_m = Acad_Annex_M.objects.filter(app_id=app_id)
    acad_annex_n = Acad_Annex_N.objects.filter(app_id=app_id)
    acad_annex_o = Acad_Annex_O.objects.filter(app_id=app_id)
    acad_annex_p = Acad_Annex_P.objects.filter(app_id=app_id)
    acad_annex_q = Acad_Annex_Q.objects.filter(app_id=app_id)
    acad_annex_r = Acad_Annex_R.objects.filter(app_id=app_id)
    acad_annex_s = Acad_Annex_S.objects.filter(app_id=app_id)
    acad_annex_t = Acad_Annex_T.objects.filter(app_id=app_id)
    acad_annex_u = Acad_Annex_U.objects.filter(app_id=app_id)
    acad_annex_v = Acad_Annex_V.objects.filter(app_id=app_id)
    acad_annex_w1_w2 = Acad_Annex_W1_W2.objects.filter(app_id=app_id)
    acad_annex_x = Acad_Annex_X.objects.filter(app_id=app_id)
    acad_annex_y = Acad_Annex_Y.objects.filter(app_id=app_id)
    acad_annex_z = Acad_Annex_Z.objects.filter(app_id=app_id)

    if acad_annex_a.count() > 0:
        response['acad_annex_a'] = acad_annex_a[0].annexure_file

    if acad_annex_b.count() > 0:
        response['acad_annex_b'] = acad_annex_b[0].annexure_file
    if acad_annex_c.count() > 0:
        response['acad_annex_c'] = acad_annex_c[0].annexure_file

    if acad_annex_d.count() > 0:
        response['acad_annex_d'] = acad_annex_d[0].annexure_file

    if acad_annex_e12.count() > 0:
        response['acad_annex_e1'] = acad_annex_e12[0].annexure_file_e1
        response['acad_annex_e2'] = acad_annex_e12[0].annexure_file_e2
        # response['total_e'] = float(acad_annex_e12[0].total_e1 + acad_annex_e12[0].total_e2)

    if acad_annex_f.count() > 0:
        response['acad_annex_f'] = acad_annex_f[0].annexure_file

    if acad_annex_g.count() > 0:
        response['acad_annex_g'] = acad_annex_g[0].annexure_file

    if acad_annex_h.count() > 0:
        response['acad_annex_h'] = acad_annex_h[0].annexure_file

    if acad_annex_i.count() > 0:
        response['acad_annex_i'] = acad_annex_i[0].annexure_file

    if acad_annex_j.count() > 0:
        response['acad_annex_j'] = acad_annex_j[0].annexure_file

    if acad_annex_k.count() > 0:
        response['acad_annex_k'] = acad_annex_k[0].annexure_file

    if acad_annex_l.count() > 0:
        response['acad_annex_l'] = acad_annex_l[0].annexure_file

    if acad_annex_m.count() > 0:
        response['acad_annex_m'] = acad_annex_m[0].annexure_file

    if acad_annex_n.count() > 0:
        response['acad_annex_n'] = acad_annex_n[0].annexure_file

    if acad_annex_o.count() > 0:
        response['acad_annex_o'] = acad_annex_o[0].annexure_file

    if acad_annex_p.count() > 0:
        response['acad_annex_p'] = acad_annex_p[0].annexure_file

    if acad_annex_q.count() > 0:
        response['acad_annex_q'] = acad_annex_q[0].annexure_file  

    if acad_annex_r.count() > 0:
        response['acad_annex_r'] = acad_annex_r[0].annexure_file

    if acad_annex_s.count() > 0:
        response['acad_annex_s'] = acad_annex_s[0].annexure_file

    if acad_annex_t.count() > 0:
        response['acad_annex_t'] = acad_annex_t[0].annexure_file

    if acad_annex_u.count() > 0:
        response['acad_annex_u'] = acad_annex_u[0].annexure_file

    if acad_annex_v.count() > 0:
        response['acad_annex_v'] = acad_annex_v[0].annexure_file

    if acad_annex_w1_w2.count() > 0:
        response['acad_annex_w1'] = acad_annex_w1_w2[0].annexure_file_w1
        response['acad_annex_w2'] = acad_annex_w1_w2[0].annexure_file_w2
        # response['total_w'] = float(acad_annex_w1_w2[0].total_w1 + acad_annex_w1_w2[0].total_w2)

    if acad_annex_x.count() > 0:
        response['acad_annex_x'] = acad_annex_x[0].annexure_file

    if acad_annex_y.count() > 0:
        response['acad_annex_y'] = acad_annex_y[0].annexure_file

    if acad_annex_z.count() > 0:
        response['acad_annex_z'] = acad_annex_z[0].annexure_file

    return render(request, 'recruit/all_annexures.djt', response)


