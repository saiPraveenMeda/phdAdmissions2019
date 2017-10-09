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
    response['qualifying_exams'] = QualifyingExam.objects.all()

    if request.method == "POST" :
        app_id = Appdata.objects.get(user=request.user)

        if not GeneralData.objects.filter(app_id=app_id).exists():
            generalData = GeneralData(app_id=app_id)
        else :
            generalData = GeneralData.objects.get(app_id=app_id)
        generalData.full_name = request.POST['Name']
        generalData.gender = request.POST['gender']
        generalData.father_name = request.POST['fatherName']
        generalData.mother_name = request.POST['motherName']
        generalData.nation = request.POST['nationality']
        generalData.dob = request.POST['dateOfBirth']
        generalData.age = calculate_age(generalData.dob)
        generalData.correspond_addr = request.POST['corresAddress']
        generalData.permanent_addr = request.POST['permanentAddress']
        generalData.category = request.POST.get('category')
        generalData.pwd = request.POST.get('pwd')
        generalData.aadhaarNo = request.POST.get('aadhaar')
        generalData.save()


        #Education Part
        if not Education.objects.filter(app_id=app_id,degreeType='UG').exists():
            ugdegree = Education(app_id=app_id)
        else :
            ugdegree = Education.objects.get(app_id=app_id,degreeType='UG')
        ugdegree.degreeType = 'UG'
        ugdegree.degreeName = request.POST['Bdegree']
        ugdegree.university = request.POST['Buniv']
        ugdegree.passingYear = request.POST['Bpassingyear']
        ugdegree.marks = request.POST['Bmarks']
        ugdegree.division = request.POST['Bdivision']
        ugdegree.save()

        if not Education.objects.filter(app_id=app_id,degreeType='PG').exists():
            pgdegree = Education(app_id=app_id)
        else :
            pgdegree = Education.objects.get(app_id=app_id,degreeType='PG')
        pgdegree.degreeType = 'PG'
        pgdegree.degreeName = request.POST['Mdegree']
        pgdegree.university = request.POST['Muniv']
        pgdegree.passingYear = request.POST['Mpassingyear']
        pgdegree.marks = request.POST['Mmarks']
        pgdegree.division = request.POST['Mdivision']
        pgdegree.save()

        #QualifyingExam
        if not QualifyingExamDetails.objects.filter(app_id=app_id).exists():
            qualexam = QualifyingExamDetails(app_id=app_id)
        else :
            qualexam = QualifyingExamDetails.objects.get(app_id=app_id)
        qualexam.exam = QualifyingExam.objects.get(name=request.POST['exam'])
        qualexam.qualifyingYear = request.POST['qualyear']
        qualexam.score = request.POST['score']
        qualexam.rank = request.POST['rank']
        qualexam.cutoffScore = request.POST['cutoffScore']
        qualexam.save()

        #Experience
        if not Experience.objects.filter(app_id=app_id).exists():
            exp = Experience(app_id=app_id)
        else :
            exp = Experience.objects.get(app_id=app_id)
        exp.teaching_exp = request.POST['teaching_exp']
        exp.research_exp = request.POST['research_exp']
        exp.industrial_exp = request.POST['industrial_exp']
        exp.save()

        #Research
        if Research.objects.filter(app_id=app_id).exists():
            Research.objects.filter(app_id=app_id).delete()
        for paper in json.loads(request.POST['papers']):
            research = Research(app_id=app_id, title=paper['title'], conference=paper['conference'], link = paper['link'])
            research.save()

        #Others
        if not Other.objects.filter(app_id=app_id).exists():
            oth = Other(app_id=app_id)
        else :
            oth = Other.objects.get(app_id=app_id)
        oth.proposedFieldOfResearch = request.POST['proposedFieldOfResearch']
        oth.save()

        flag = Flag.objects.get(app_id=app_id)
        flag.application = True
        flag.save()

        response['message'] = 'Profile saved successfully'
        if request.POST['submitbtn'] == 'saveandcontinue':
            return redirect('/annexures')

    if Appdata.objects.filter(user=request.user).exists() :
        app_id = Appdata.objects.get(user=request.user)
        if GeneralData.objects.filter(app_id=app_id).exists():
            response['generalData'] = GeneralData.objects.get(app_id=app_id)
        if Experience.objects.filter(app_id=app_id).exists():
            response['Experience'] = Experience.objects.get(app_id=app_id)

        if Education.objects.filter(app_id=app_id,degreeType='UG').exists():
            response['Bqual'] = Education.objects.get(app_id=app_id,degreeType='UG')
        if Education.objects.filter(app_id=app_id,degreeType='PG').exists():
            response['Mqual'] = Education.objects.get(app_id=app_id,degreeType='PG')

        if QualifyingExamDetails.objects.filter(app_id=app_id).exists():
            response['QExamDetails'] = QualifyingExamDetails.objects.get(app_id=app_id)

        if Research.objects.filter(app_id=app_id).exists():
            response['papers'] = Research.objects.filter(app_id=app_id)
            response['papersJSON'] = json.dumps(list(Research.objects.filter(app_id=app_id).values('title', 'conference', 'link')))

        if Other.objects.filter(app_id=app_id).exists():
            response['Others'] = Other.objects.get(app_id=app_id)

    return render(request,'recruit/mainForm.djt',response)


@login_required(login_url='/register')
@is_applicant(login_url='/register')
def annexures(request):
    response ={}
    app_id = Appdata.objects.get(user=request.user)
    flags = Flag.objects.get(app_id=app_id)
    gd = GeneralData.objects.get(app_id=app_id)
    cat = gd.category
    post = app_id.post_for

    if not flags.application:
        redirect('recruit')

    if request.method == 'POST':
        if flags.annexure_obc and flags.annexure_parttime:
            redirect('recruit/uploadDocs')
        redirect('recruit/annexures')

    if cat == 'OBC':
        response['obc'] = True
        response['obc_filled'] = flags.annexure_obc
    else:
        response['obc'] = False

    if post == 'Part Time':
        response['parttime'] = True
        response['parttime_filled'] = flags.annexure_parttime

    return render(request, 'recruit/annexures_master.djt', response);


@login_required(login_url='/register')
@is_applicant(login_url='/register')
def uploadDocs(request):
    response = {}
    return HttpResponse('Yoooo')


@login_required(login_url='/register')
@is_applicant(login_url='/register')
def uploadpic(request):
    response = {}
    profile = Appdata.objects.get(user=request.user)

    flags = Flag.objects.get(app_id=profile)

    response['profile'] = profile

    if request.method == 'POST' :
        file = request.FILES['profilepic']
        profile.profilePic = file
        profile.save()

        flags.profile_pic = True
        flags.save()

        return redirect('/')
    return render(request,'recruit/uploadpic.djt',response)



@login_required(login_url='/register')
@is_applicant(login_url='/register')
def annexure_obc(request):
    response = {}
    if request.method == 'POST':
        if Annexure_OBC.objects.filter(app_id=Appdata.objects.get(user=request.user)).exists():
            Annexure = Annexure_OBC.objects.get(app_id=Appdata.objects.get(user=request.user))
        else:
            Annexure = Annexure_OBC(app_id=Appdata.objects.get(user=request.user))
        Annexure.name = request.POST['name']
        Annexure.gender = request.POST['gender']
        Annexure.parent_name = request.POST['parent_name']
        Annexure.village = request.POST['village']
        Annexure.district = request.POST['disctrict']
        Annexure.state = request.POST['state']
        Annexure.community = request.POST['community']

        Annexure.save()

    if Annexure_OBC.objects.filter(app_id=Appdata.objects.get(user=request.user)).exists():
        Annexure = Annexure_OBC.objects.get(app_id=Appdata.objects.get(user=request.user))
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
        if Annexure_Part_Time.objects.filter(app_id=Appdata.objects.filter(user=request.user)).exists():
            Annexure = Annexure_Part_Time.objects.filter(app_id=Appdata.objects.filter(user=request.user))
        else:
            Annexure = Annexure_Part_Time(app_id=Appdata.objects.filter(user=request.user))
        Annexure.name = request.POST['name']
        Annexure.designation = request.POST['designation']
        Annexure.date = request.POST['date']
        Annexure.address = request.POST['address']
        Annexure.employment_years = request.POST['employment_years']

        Annexure.save()

    if Annexure_Part_Time.objects.filter(app_id=Appdata.objects.filter(user=request.user)).exists():
        Annexure = Annexure_Part_Time.objects.filter(app_id=Appdata.objects.filter(user=request.user))
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
    if GeneralData.objects.filter(app_id=app_id).exists():
        response['generalData'] = GeneralData.objects.get(app_id=app_id)
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
    
    return render(request, 'recruit/print_main_application.djt', response)

@login_required(login_url='/register')
@is_applicant(login_url='/register')
def print_annexures(request):
    response = {}
    response['profile'] = Appdata.objects.get(user = request.user)
    app_id = Appdata.objects.get(user=request.user)

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
    content = 'Your Application for the position of '+app.post_for+' PHD student'
    content = content + ' in '+app.post_in+' has been submitted on '
    content = content + app.submitDate.strftime('%Y-%m-%d %H:%M')
    rlist = []
    rlist.append(receiver)
    subject = 'NIT WARANGAL - Acknowlegement for Submission of PhD Admission Application'
    print (mailid+" : "+content)
    try:
        send_mail(subject,content,sender,rlist,fail_silently=False,)
    except BadHeaderError:
        return HttpResponse('Invalid header found.')

    return redirect('/subject_ref')

def printAck(request):
    response = {}
    app = Appdata.objects.get(user=request.user)
    response['GeneralData'] = GeneralData.objects.get(app_id=app)
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


def all_annexures(request) :
    response = {}
    app_id = Appdata.objects.get(user=request.user)
    response['profile'] = Appdata.objects.get(user = request.user)
    obc = Annexure_OBC.objects.filter(app_id=app_id)
    parttime = Annexure_Part_Time.objects.filter(app_id=app_id)

    return render(request, 'recruit/all_annexures.djt', response)


