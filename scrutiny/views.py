# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required, user_passes_test
from .models import ScrutinyUserProfile as ScrutinizerProfile
from recruit.models import *
from registration.models import Department
# from recruit.models import Appdata

def is_dean(user):
    return user.groups.filter(name="Dean").exists()
def is_hod(user):
    return user.groups.filter(name="HOD").exists()
def is_scrutinizer(login_url=None):
	return user_passes_test(lambda u: (is_hod(u) or is_dean(u)), login_url=login_url)

@login_required(login_url='/register')
@is_scrutinizer(login_url='/register')
def index(request):
	response ={}
	userprofile = ScrutinizerProfile.objects.get(user=request.user)
	if is_dean(request.user):
		isDean = True
		applns_yes = Appdata.objects.filter(submitted=True, verified=True)
		applns_no = Appdata.objects.filter(submitted=True, verified=False)
		
	elif is_hod(request.user):
		isDean = False
		applns_yes = Appdata.objects.filter(submitted=True, verified=True, post_in=userprofile.department, shortlisted=True)
		applns_no = Appdata.objects.filter(submitted=True, verified=True, post_in=userprofile.department, shortlisted=False)
	response['applns_yes'] = applns_yes
	response['applns_no'] = applns_no
	response['is_dean'] = isDean
	return render(request,'scrutiny/applications.djt',response)

@login_required(login_url='/register')
@is_scrutinizer(login_url='/register')
def verifyApplication(request, applnid):
	if is_dean(request.user):
		if Appdata.objects.filter(app_id=applnid).exists():
			appln = Appdata.objects.get(app_id=applnid)
			appln.verified = True
			appln.save()
	return HttpResponseRedirect('/scrutiny')

@login_required(login_url='/register')
@is_scrutinizer(login_url='/register')
def shortlistApplication(request, applnid):
	if is_hod(request.user) and request.method == 'POST':
		if Appdata.objects.filter(app_id=applnid).exists():
			appln = Appdata.objects.get(app_id=applnid)
			appln.shortlisted = request.POST['check']
			appln.remark = request.POST['content']
			appln.save()
	return HttpResponseRedirect('/scrutiny')


@login_required(login_url='/register')
@is_scrutinizer(login_url='/register')
def unshortlistApplication(request, applnid):
	if is_hod(request.user) and request.method == 'GET':
		if Appdata.objects.filter(app_id=applnid).exists():
			appln = Appdata.objects.get(app_id=applnid)
			appln.shortlisted = False
			appln.save()
	return HttpResponseRedirect('/scrutiny')


@login_required(login_url='/register')
@is_scrutinizer(login_url='/register')
def viewApplication(request, applnid):
	response ={}
	if not Appdata.objects.filter(app_id=applnid).exists():
		return HttpResponseRedirect('/scrutiny')
	response['is_dean'] = is_dean(request.user)
	app_id = Appdata.objects.get(app_id=applnid)
	response['is_verified'] = app_id.verified
	response['is_shortlisted'] = app_id.shortlisted
	response['profile'] = app_id
	response['user'] = User.objects.get(username=applnid)
	userprofile = ScrutinizerProfile.objects.get(user=request.user)

	if not is_dean(request.user) and app_id.post_in!=userprofile.department:
		return HttpResponseRedirect('/scrutiny')

	if PaymentDetails.objects.filter(appID=app_id).exists():
		response['payment'] = PaymentDetails.objects.get(appID=app_id)
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

	if Other.objects.filter(app_id=app_id).exists():
		response['Others'] = Other.objects.get(app_id=app_id)

	if Document.objects.filter(app_id=app_id).exists():
		flags = Flag.objects.get(app_id=app_id)
		gd = GeneralData.objects.get(app_id=app_id)
		qe = QualifyingExamDetails.objects.get(app_id=app_id)
		docs = Document.objects.get(app_id=app_id)

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
	return render(request, 'scrutiny/appln_view.djt', response)


@login_required(login_url='/register')
@is_scrutinizer(login_url='/register')
def generateReport(request):
	response = {}
	status = request.POST['status']
	if is_dean(request.user):
		quals = Appdata.objects.filter(submitted=True, verified=status).all()
	else:
		userprofile = ScrutinizerProfile.objects.get(user=request.user)
		quals = Appdata.objects.filter(verified=True, shortlisted=status,post_in=userprofile.department).order_by('qualifyingexamdetails__exam_id', '-qualifyingexamdetails__score')
		response['dept'] = userprofile.department.name
	response['quals'] = quals
	response['is_dean'] = is_dean(request.user)
	response['status'] = status
	return render(request, 'scrutiny/report.djt', response)