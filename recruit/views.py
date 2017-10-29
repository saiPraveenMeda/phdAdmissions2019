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
from django.core.mail import send_mail, BadHeaderError
import smtplib

def is_applicant(login_url=None):
    return user_passes_test(lambda u: u.groups.filter(name='Applicant').exists(), login_url=login_url)

def is_file_exists(file):
    if file == None or file.url in [None, '']:
        return False
    if os.path.isfile(os.path.join(settings.BASE_DIR, file.url[1:])):
        return True
    return False

@login_required(login_url='/register')
@is_applicant(login_url='/register')
def index(request) :
    response = {}
    response['message'] = ''
    app = Appdata.objects.get(user=request.user)
    flags = Flag.objects.get(app_id=app)
    if app.paymentUploaded == False :
        return redirect('/register/paymentDetails')
    if app.submitted :
        return redirect('/submit')

    profile = Appdata.objects.get(user=request.user)
    response['profile'] = profile
    if app.post_in.deptID in [1,2,3,4,5,6,7,8]:
        response['qualifying_exams'] = QualifyingExam.objects.filter(type=1)
    if app.post_in.deptID in [9,10,11,12]:
        response['qualifying_exams'] = QualifyingExam.objects.filter(type=2)
    if app.post_in.deptID in [13]:
        response['qualifying_exams'] = QualifyingExam.objects.filter(type=3)

    if request.method == "POST" :
        app_id = Appdata.objects.get(user=request.user)
        if app_id.post_for.name == 'Full Time':
            flags.guidebio = True
        if not GeneralData.objects.filter(app_id=app_id).exists():
            generalData = GeneralData(app_id=app_id)
        else :
            generalData = GeneralData.objects.get(app_id=app_id)
        if not QualifyingExamDetails.objects.filter(app_id=app_id).exists():
            qualexam = QualifyingExamDetails(app_id=app_id)
        else :
            qualexam = QualifyingExamDetails.objects.get(app_id=app_id)

        if request.POST['category'] != 'OBC':
            Annexure_OBC.objects.filter(app_id=app_id).delete()
            flags.annexure_obc = True
        else:
            if generalData.category != 'OBC':
                flags.annexure_obc = False

        if request.POST['category'] == 'UR':
            if Document.objects.filter(app_id=app_id).exists():
                if generalData.category != 'UR':
                    d = Document.objects.get(app_id=app_id)
                    os.remove(os.path.join(settings.BASE_DIR, d.CasteCertificate.url[1:]))
            flags.caste_certi = True
        else:
            if generalData.category == 'UR':
                flags.caste_certi = False
        if request.POST['pwd'] == 'no':
            if Document.objects.filter(app_id=app_id).exists():
                if generalData.pwd != 'no':
                    d = Document.objects.get(app_id=app_id)
                    os.remove(os.path.join(settings.BASE_DIR, d.PWDCertificate.url[1:]))
            flags.pwd_certi = True
        else:
            if generalData.pwd == 'no':
                flags.pwd_certi = False

        if int(request.POST['exam']) in [12,13,14]:
            QualifyingExamDetails.objects.filter(app_id=app_id).delete()
            flags.qualifying_scorecard = True
        else:
            try:
                if int(qualexam.exam.id) in [12, 13, 14]:
                    flags.qualifying_scorecard = False
            except:
                flags.qualifying_scorecard = False
        flags.save()

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
        try:
            generalData.save()
        except:
            response['message'] += 'Date format incorrect. Please correct and save again'


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
        qualexam.exam = QualifyingExam.objects.get(id=int(request.POST['exam']))
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

        #Others
        if not Other.objects.filter(app_id=app_id).exists():
            oth = Other(app_id=app_id)
        else :
            oth = Other.objects.get(app_id=app_id)
        oth.proposedFieldOfResearch = request.POST['proposedFieldOfResearch']
        oth.save()

        flags.application = True
        if app_id.post_for.name == 'Full Time':
            flags.annexure_parttime = True
        if generalData.category == 'UR':
            flags.caste_certi = True
        flags.save()

        #Research
        oldpapers = request.POST['oldpapers']
        if not oldpapers == '':
            oldpapers = json.loads(oldpapers)
        else:
            oldpapers = {}
        oldpapers = [int((n.values()[0]).split('_')[1]) for n in oldpapers]
        for p in Research.objects.filter(app_id=app_id):
            if not p.id in oldpapers:
                p.delete()
        addedpapers = request.POST['papers']
        if not addedpapers == '':
            addedpapers = json.loads(addedpapers)
        else:
            addedpapers = {}

        for paper in addedpapers:
            research = Research(app_id=app_id, title=paper['title'], conference=paper['conference'], link=request.FILES['paper'+str(paper['index'])])
            if validateFormat(research.link):
                research.save()
            else:
                response['message'] += 'Only PDF Format is allowed for research papers.'
        if Research.objects.filter(app_id=app_id).exists():
            flags.papers = all([is_file_exists(file.link) for file in list(Research.objects.filter(app_id=app_id))])
        else:
            flags.papers = True
        flags.save()


        response['message'] += 'Profile saved successfully'
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
            response['papersJSON'] = json.dumps(list(Research.objects.filter(app_id=app_id).values('title', 'conference')))

        if Other.objects.filter(app_id=app_id).exists():
            response['Others'] = Other.objects.get(app_id=app_id)

    response['status1'] = flags.application and flags.profile_pic
    response['status2'] = flags.annexure_obc and flags.annexure_parttime
    response['status3'] = all([flags.ssc, flags.intermediate, flags.bacheoler_degree, flags.bacheoler_memo, flags.masters_degree, flags.masters_memo, flags.qualifying_scorecard, flags.caste_certi, flags.pwd_certi, flags.guidebio])
    response['status4'] = profile.paymentUploaded
    return render(request,'recruit/mainForm.djt',response)


@login_required(login_url='/register')
@is_applicant(login_url='/register')
def annexures(request):
    response ={}
    app_id = Appdata.objects.get(user=request.user)
    flags = Flag.objects.get(app_id=app_id)
    gd = GeneralData.objects.get(app_id=app_id)
    cat = gd.category
    post = app_id.post_for.name

    if app_id.paymentUploaded == False :
        return redirect('/register/paymentDetails')
    if app_id.submitted :
        return redirect('/submit')

    response['profile'] = app_id

    if not flags.application:
        redirect('recruit')

    if request.method == 'POST':
        if flags.annexure_obc and flags.annexure_parttime:
            return redirect('recruit/uploadDocs')
        return redirect('recruit/annexures')

    if cat != 'OBC' and post != 'Part Time':
        return redirect('/uploadDocs')

    if cat == 'OBC':
        response['obc'] = True
        response['obc_filled'] = flags.annexure_obc
    else:
        response['obc'] = False

    if post == 'Part Time':
        response['parttime'] = True
        response['parttime_filled'] = flags.annexure_parttime

    response['status1'] = flags.application and flags.profile_pic
    response['status2'] = flags.annexure_obc and flags.annexure_parttime
    response['status3'] = all([flags.ssc, flags.intermediate, flags.bacheoler_degree, flags.bacheoler_memo, flags.masters_degree, flags.masters_memo, flags.qualifying_scorecard, flags.caste_certi, flags.pwd_certi, flags.guidebio])
    response['status4'] = app_id.paymentUploaded
    return render(request, 'recruit/annexures_master.djt', response);


@login_required(login_url='/register')
@is_applicant(login_url='/register')
def uploadDocs(request):
    response ={}
    app_id = Appdata.objects.get(user=request.user)
    flags = Flag.objects.get(app_id=app_id)
    gd = GeneralData.objects.get(app_id=app_id)
    qe = QualifyingExamDetails.objects.get(app_id=app_id)

    if app_id.paymentUploaded == False :
        return redirect('/register/paymentDetails')
    if app_id.submitted :
        return redirect('/submit')

    response['profile'] = app_id
    response['QExam'] = qe
    response['message'] = []
    if Document.objects.filter(app_id=app_id).exists():
        docs = Document.objects.get(app_id=app_id)
    else:
        docs = Document(app_id=app_id)
    if not all([flags.annexure_obc, flags.annexure_parttime]):
        return redirect('/annexures')

    if request.method == 'POST':
        if 'SSC' in request.FILES:
            docs.SSC = request.FILES['SSC']
        if 'Intermediate' in request.FILES:
            docs.Intermediate = request.FILES['Intermediate']
        if 'GuideBio' in request.FILES:
            docs.GuideBio = request.FILES['GuideBio']
        if 'UDegree' in request.FILES:
            docs.UDegree = request.FILES['UDegree']
        if 'UMemo' in request.FILES:
            docs.UMemo = request.FILES['UMemo']
        if 'MDegree' in request.FILES:
            docs.MDegree = request.FILES['MDegree']
        if 'MMemo' in request.FILES:
            docs.MMemo = request.FILES['MMemo']
        if 'CasteCertificate' in request.FILES:
            docs.CasteCertificate = request.FILES['CasteCertificate']
        if 'QualifyingExamScoreCard' in request.FILES:
            docs.QualifyingExamScoreCard = request.FILES['QualifyingExamScoreCard']
        if 'PWDCertificate' in request.FILES:
            docs.PWDCertificate = request.FILES['PWDCertificate']

        if not (((not docs.UDegree) or validateFormat(docs.UDegree)) and
            ((not docs.UMemo) or validateFormat(docs.UMemo)) and
            ((not docs.MDegree) or validateFormat(docs.MDegree)) and
            ((not docs.MMemo) or validateFormat(docs.MMemo)) and
            (int(qe.exam.id) in [12, 13, 14] or (not docs.QualifyingExamScoreCard) or validateFormat(docs.QualifyingExamScoreCard)) and
            (gd.category=='UR' or (not docs.CasteCertificate) or validateFormat(docs.CasteCertificate)) and
            (gd.pwd=='no' or (not docs.PWDCertificate) or validateFormat(docs.PWDCertificate)) and
            (app_id.post_for.name=='Full Time' or (not docs.GuideBio) or validateFormat(docs.GuideBio))):

            response['message'].append('Only PDF Format is allowed.')
        else:
            docs.save()

        flags.ssc = is_file_exists(docs.SSC)
        flags.intermediate = is_file_exists(docs.Intermediate)
        flags.bacheoler_degree = is_file_exists(docs.UDegree)
        flags.bacheoler_memo = is_file_exists(docs.UMemo)
        flags.masters_degree = is_file_exists(docs.MDegree)
        flags.masters_memo = is_file_exists(docs.MMemo)
        if int(qe.exam.id) not in [12, 13, 14]:
            flags.qualifying_scorecard = is_file_exists(docs.QualifyingExamScoreCard)
        if gd.category != 'UR':
            flags.caste_certi = is_file_exists(docs.CasteCertificate)
        if gd.pwd != 'no':
            flags.pwd_certi = is_file_exists(docs.PWDCertificate)
        if app_id.post_for.name == 'Part Time':
            flags.guidebio = is_file_exists(docs.GuideBio)

        flags.save()

        if all([flags.ssc, flags.intermediate, flags.bacheoler_degree, flags.bacheoler_memo, flags.masters_degree, flags.masters_memo, flags.qualifying_scorecard, flags.caste_certi, flags.pwd_certi, flags.guidebio]):
            response['message'].append('All files are uploaded successfully')
        else:
            response['message'].append('Some files failed to upload. Re-upload them !')

    response['SSC'] = flags.ssc
    if flags.ssc:
        response['SSCURL'] = docs.SSC.url
    response['Intermediate'] = flags.intermediate
    if flags.intermediate:
        response['IntermediateURL'] = docs.Intermediate.url
    response['UDegree'] = flags.bacheoler_degree
    if flags.bacheoler_degree:
        response['UDegreeURL'] = docs.UDegree.url
    response['UMemo'] = flags.bacheoler_memo
    if flags.bacheoler_memo:
        response['UMemoURL'] = docs.UMemo.url
    response['MDegree'] = flags.masters_degree
    if flags.masters_degree:
        response['MDegreeURL'] = docs.MDegree.url
    response['MMemo'] = flags.masters_memo
    if flags.masters_memo:
        response['MMemoURL'] = docs.MMemo.url
    if int(qe.exam.id) not in [12, 13, 14]:
        response['isQual'] = True
        response['QualifyingExamScoreCard'] = flags.qualifying_scorecard
        if flags.qualifying_scorecard:
            response['QualifyingExamScoreCardURL'] = docs.QualifyingExamScoreCard.url
    if gd.category != 'UR':
        response['isReserved'] = True
        response['CasteCertificate'] = flags.caste_certi
        if flags.caste_certi:
            response['CasteCertificateURL'] = docs.CasteCertificate.url
    if gd.pwd == 'yes':
        response['isPWD'] = True
        response['PWDCertificate'] = flags.pwd_certi
        if flags.pwd_certi:
            response['PWDCertificateURL'] = docs.PWDCertificate.url
    if app_id.post_for.name == 'Part Time':
        response['isPartTime'] = True
        response['GuideBio'] = flags.guidebio
        if flags.guidebio:
            response['GuideBioURL'] = docs.GuideBio.url


    response['finalsubbtn'] = True
    response['status1'] = flags.application and flags.profile_pic
    response['status2'] = flags.annexure_obc and flags.annexure_parttime
    response['status3'] = all([flags.ssc, flags.intermediate, flags.bacheoler_degree, flags.bacheoler_memo, flags.masters_degree, flags.masters_memo, flags.qualifying_scorecard, flags.caste_certi, flags.pwd_certi, flags.guidebio])
    response['status4'] = app_id.paymentUploaded
    return render(request, 'recruit/docs.djt', response)


@login_required(login_url='/register')
@is_applicant(login_url='/register')
def uploadpic(request):
    response = {}
    profile = Appdata.objects.get(user=request.user)

    flags = Flag.objects.get(app_id=profile)

    if profile.paymentUploaded == False :
        return redirect('/register/paymentDetails')
    if profile.submitted :
        return redirect('/submit')

    response['profile'] = profile

    if request.method == 'POST' :
        file = request.FILES['profilepic']
        if validatePic(file):
            profile.profilePic = file
            profile.save()
            if is_file_exists(profile.profilePic):
                flags.profile_pic = True;
                flags.save()
            return redirect('/')
        else:
            response['message'] = 'Only \'.jpg\' format is allowed'
            return render(request,'recruit/uploadpic.djt',response)

    response['status1'] = flags.application and flags.profile_pic
    response['status2'] = flags.annexure_obc and flags.annexure_parttime
    response['status3'] = all([flags.ssc, flags.intermediate, flags.bacheoler_degree, flags.bacheoler_memo, flags.masters_degree, flags.masters_memo, flags.qualifying_scorecard, flags.caste_certi, flags.pwd_certi, flags.guidebio])
    response['status4'] = profile.paymentUploaded
    return render(request,'recruit/uploadpic.djt',response)



@login_required(login_url='/register')
@is_applicant(login_url='/register')
def annexure_obc(request):
    response = {}
    app_id = Appdata.objects.get(user=request.user)
    flags = Flag.objects.get(app_id=app_id)
    gd = GeneralData.objects.get(app_id=app_id)

    if app_id.paymentUploaded == False :
        return redirect('/register/paymentDetails')
    if app_id.submitted :
        return redirect('/submit')

    response['profile'] = app_id

    if not flags.application:
        return redirect('/')

    if gd.category != 'OBC':
        return redirect('/')

    if request.method == 'POST':
        if Annexure_OBC.objects.filter(app_id=Appdata.objects.get(user=request.user)).exists():
            Annexure = Annexure_OBC.objects.get(app_id=Appdata.objects.get(user=request.user))
        else:
            Annexure = Annexure_OBC(app_id=Appdata.objects.get(user=request.user))
        Annexure.name = request.POST['name']
        Annexure.gender = request.POST['gender']
        Annexure.parent_name = request.POST['parent_name']
        Annexure.village = request.POST['village']
        Annexure.district = request.POST['district']
        Annexure.state = request.POST['state']
        Annexure.community = request.POST['community']

        Annexure.save()

        flags.annexure_obc = True
        flags.save()

        response['message'] = 'Annexure - II saved successfully'

        if request.POST['submitbtn'] == 'saveandcontinue':
            return redirect('/annexures')


    if Annexure_OBC.objects.filter(app_id=Appdata.objects.get(user=request.user)).exists():
        Annexure = Annexure_OBC.objects.get(app_id=Appdata.objects.get(user=request.user))
        response['name'] = Annexure.name
        response['gender'] = Annexure.gender
        response['parent_name'] = Annexure.parent_name
        response['village'] = Annexure.village
        response['district'] = Annexure.district
        response['state'] = Annexure.state
        response['community'] = Annexure.community

    response['status1'] = flags.application and flags.profile_pic
    response['status2'] = flags.annexure_obc and flags.annexure_parttime
    response['status3'] = all([flags.ssc, flags.intermediate, flags.bacheoler_degree, flags.bacheoler_memo, flags.masters_degree, flags.masters_memo, flags.qualifying_scorecard, flags.caste_certi, flags.pwd_certi, flags.guidebio])
    response['status4'] = app_id.paymentUploaded
    return render(request, 'recruit/annexure/annexure_obc.djt', response)


@login_required(login_url='/register')
@is_applicant(login_url='/register')
def annexure_parttime(request):
    response = {}
    app_id = Appdata.objects.get(user=request.user)
    flags = Flag.objects.get(app_id=app_id)

    if app_id.paymentUploaded == False :
        return redirect('/register/paymentDetails')
    if app_id.submitted :
        return redirect('/submit')

    response['profile'] = app_id

    if not flags.application:
        return redirect('/')

    if app_id.post_for.name == 'Full Time':
        redirect('/')

    if request.method == 'POST':
        if Annexure_Part_Time.objects.filter(app_id=Appdata.objects.get(user=request.user)).exists():
            Annexure = Annexure_Part_Time.objects.get(app_id=Appdata.objects.get(user=request.user))
        else:
            Annexure = Annexure_Part_Time(app_id=Appdata.objects.get(user=request.user))
        Annexure.name = request.POST['name']
        Annexure.designation = request.POST['designation']
        Annexure.date = request.POST['date']
        Annexure.address = request.POST['address']
        Annexure.employment_years = request.POST['employment_years']
        Annexure.guide = request.POST['guide']

        Annexure.save()

        flags.annexure_parttime = True
        flags.save()

        response['message'] = 'Annexure - III & IV saved successfully'

        if request.POST['submitbtn'] == 'saveandcontinue':
            return redirect('/annexures')


    if Annexure_Part_Time.objects.filter(app_id=Appdata.objects.get(user=request.user)).exists():
        Annexure = Annexure_Part_Time.objects.get(app_id=Appdata.objects.get(user=request.user))
        response['name'] = Annexure.name
        response['designation'] = Annexure.designation
        response['date'] = Annexure.date
        response['address'] = Annexure.address
        response['employment_years'] = Annexure.employment_years
        response['guide'] = Annexure.guide

    response['status1'] = flags.application and flags.profile_pic
    response['status2'] = flags.annexure_obc and flags.annexure_parttime
    response['status3'] = all([flags.ssc, flags.intermediate, flags.bacheoler_degree, flags.bacheoler_memo, flags.masters_degree, flags.masters_memo, flags.qualifying_scorecard, flags.caste_certi, flags.pwd_certi, flags.guidebio])
    response['status4'] = app_id.paymentUploaded
    return render(request, 'recruit/annexure/annexure_parttime.djt', response)


@login_required(login_url='/register')
@is_applicant(login_url='/register')
def submit(request):
    response = {}
    app_id = Appdata.objects.get(user=request.user)
    flags = Flag.objects.get(app_id=app_id)
    gd = GeneralData.objects.get(app_id=app_id)

    if not all([flags.application, flags.annexure_obc, flags.annexure_parttime, flags.bacheoler_degree, flags.bacheoler_memo, flags.masters_degree, flags.masters_memo, flags.qualifying_scorecard, flags.caste_certi]):
        return redirect('/')

    if not app_id.submitted:
        app_id.submitted = True
        app_id.submitDate = datetime.datetime.now()
        app_id.save()

        mailid = request.user.email

        receiver = mailid
        sender = settings.EMAIL_HOST_USER
        content = 'Your Application for '+ app_id.post_for.name + ' PhD'
        content = content + ' in '+ app_id.post_in.name +' - NIT Warangal has been submitted on '
        content = content + app_id.submitDate.strftime('%Y-%m-%d %H:%M')
        rlist = []
        rlist.append(receiver)
        subject = 'Acknowlegement for Submission of Application'
        try:
            send_mail(subject,content,sender,rlist,fail_silently=False,)
        except:
            return HttpResponse('Your application is submitted, but we couldn\'t send you a mail. Contact us immediately (support_admissions_2017@nitw.ac.in)')

    response['isAnnexure'] = (app_id.post_for.name == 'Part Time' or gd.category == 'OBC')

    return render(request,'recruit/summary.djt',response)

@login_required(login_url='/register')
@is_applicant(login_url='/register')
def print_main_application(request):
    response = {}
    response['profile'] = Appdata.objects.get(user = request.user)
    app_id = Appdata.objects.get(user=request.user)

    if not app_id.submitted:
        return render('/')

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
    
    return render(request, 'recruit/print_main_application.djt', response)


@login_required(login_url='/register')
@is_applicant(login_url='/register')
def print_annexures(request):
    response = {}
    app = Appdata.objects.get(user = request.user)
    response['profile'] = app

    if not app.submitted:
        return render('/')

    gd = GeneralData.objects.get(app_id=app)
    if gd.category != 'OBC' and app.post_for == 'FullTime':
        return redirect('/summary')

    if Annexure_OBC.objects.filter(app_id=Appdata.objects.get(user=request.user)).exists():
        response['isOBC'] = True
        Annexure = Annexure_OBC.objects.get(app_id=Appdata.objects.get(user=request.user))
        response['obc'] = Annexure
    else:
        response['isOBC'] = False

    if Annexure_Part_Time.objects.filter(app_id=Appdata.objects.get(user=request.user)).exists():
        response['isPartTime'] = True
        Annexure = Annexure_Part_Time.objects.get(app_id=Appdata.objects.get(user=request.user))
        response['parttime'] = Annexure
    else:
        response['isPartTime'] = False

    return render(request, 'recruit/print_annexures.djt', response)

@login_required(login_url='/register')
@is_applicant(login_url='/register')
def printAck(request):
    response = {}
    app = Appdata.objects.get(user=request.user)
    if not app.submitted:
        return render('/')
    response['GeneralData'] = GeneralData.objects.get(app_id=app)
    response['app'] = app
    return render(request,'recruit/printAck.djt',response)

def validateFormat(filename):
    ext = os.path.splitext(filename.name)[1]
    valid_extentions = ['.pdf']
    if not ext.lower() in valid_extentions:
        return False
    return True

def validatePic(filename):
    ext = os.path.splitext(filename.name)[1]
    valid_extentions = ['.jpg']
    if not ext.lower() in valid_extentions:
        return False
    return True

def calculate_age(dob):
    born = datetime.datetime.strptime(dob, "%Y-%m-%d")
    today = datetime.date.today()
    return today.year - born.year - ((today.month, today.day) < (born.month, born.day))


