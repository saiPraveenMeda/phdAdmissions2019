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

def is_applicant(login_url=None):
    return user_passes_test(lambda u: u.groups.filter(name='Applicant').exists(), login_url=login_url)

@login_required(login_url='/register')
@is_applicant(login_url='/register')
def index(request) :
    response = {}
    app = Appdata.objects.get(user=request.user)
    if app.paymentUploaded == False :
        return redirect('/register/paymentDetails')
    if app.submitted :
        return redirect('/printSummary')
    profile = Appdata.objects.get(user=request.user)
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


    if Appdata.objects.filter(user=request.user).exists() :
        app_id = Appdata.objects.get(user=request.user)
        response['postID'] = Post.objects.get(name=app_id.post_for).name
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
        if Paper.objects.filter(app_id=app_id).exists() :
            paperobj = Paper.objects.get(app_id=app_id)
            response['paperobj'] = paperobj

    return render(request,'recruit/mainForm.djt',response)


@login_required(login_url='/register')
@is_applicant(login_url='/register')
def annexure_obc(request):
    response = {}
    if request.method == 'POST':
        if Annexure_OBC.objects.filter(app_id=Appdata.objects.filter(user=request.user)).exists():
            Annexure = Annexure_OBC.objects.filter(app_id=Appdata.objects.filter(user=request.user))
        else:
            Annexure = Annexure_OBC(app_id=Appdata.objects.filter(user=request.user))
        response['name'] = Annexure.name = request.POST['name']
        response['gender'] = Annexure.gender = request.POST['gender']
        response['parent_name'] = Annexure.parent_name = request.POST['parent_name']
        response['village'] = Annexure.village = request.POST['village']
        response['district'] = Annexure.district = request.POST['disctrict']
        response['state'] = Annexure.state = request.POST['state']
        response['community'] = Annexure.community = request.POST['community']

        Annexure.save()

    else:
        if Annexure_OBC.objects.filter(app_id=Appdata.objects.filter(user=request.user)).exists():
            Annexure = Annexure_OBC.objects.filter(app_id=Appdata.objects.filter(user=request.user))
            response['name'] = Annexure.name
            response['gender'] = Annexure.gender
            response['parent_name'] = Annexure.parent_name
            response['village'] = Annexure.village
            response['district'] = Annexure.district
            response['state'] = Annexure.state
            response['community'] = Annexure.community

    return render(request, 'recruit/annexure/annexure_obc.djt', response)


@login_required(login_url='/register')
@is_applicant(login_url='/register')
def annexure_parttime(request):
    response = {}
    if request.method == 'POST':
        if Annexure_PartTime.objects.filter(app_id=Appdata.objects.filter(user=request.user)).exists():
            Annexure = Annexure_PartTime.objects.filter(app_id=Appdata.objects.filter(user=request.user))
        else:
            Annexure = Annexure_PartTime(app_id=Appdata.objects.filter(user=request.user))
        response['name'] = Annexure.name = request.POST['name']
        response['designation'] = Annexure.designation = request.POST['designation']
        response['date'] = Annexure.date = request.POST['date']
        response['address'] = Annexure.address = request.POST['address']
        response['employment_years'] = Annexure.employment_years = request.POST['employment_years']

        Annexure.save()

    else:
        if Annexure_PartTime.objects.filter(app_id=Appdata.objects.filter(user=request.user)).exists():
            Annexure = Annexure_PartTime.objects.filter(app_id=Appdata.objects.filter(user=request.user))
            response['name'] = Annexure.name
            response['designation'] = Annexure.designation
            response['date'] = Annexure.date
            response['address'] = Annexure.address
            response['employment_years'] = Annexure.employment_years

    return render(request, 'recruit/annexure/annexure_parttime.djt', response)


@login_required(login_url='/register')
@is_applicant(login_url='/register')
def printSummary(request):
    response = {}
    return render(request,'recruit/summary.djt',response)

@login_required(login_url='/register')
@is_applicant(login_url='/register')
def print_main_application(request):
    response = {}
    response['profile'] = Appdata.objects.get(user = request.user)
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
@is_applicant(login_url='/register')
def print_annexures(request):
    response = {}
    response['profile'] = Appdata.objects.get(user = request.user)
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
    sender = 'support_admissions_2017@nitw.ac.in'
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
    response['profile'] = Appdata.objects.get(user = request.user)
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


