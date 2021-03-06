from __future__ import unicode_literals
from django.conf import settings
from django.shortcuts import render, render_to_response, redirect
from django.http import HttpResponse, HttpResponseRedirect, HttpRequest, Http404,JsonResponse
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required,user_passes_test
from django.contrib.auth.models import User, Group
from recruit.models import Appdata, Flag, PaymentDetails
import random, string
from .models import *
import datetime
from django.core.mail import send_mail, BadHeaderError
import smtplib
import os
import unicodedata

def is_dean(user):
    return user.groups.filter(name="Dean").exists()
def is_hod(user):
    return user.groups.filter(name="HOD").exists()
def is_applicant(login_url=None):
    return user_passes_test(lambda u: u.groups.filter(name='Applicant').exists(), login_url=login_url)

def validateFormat(filename):
    ext = os.path.splitext(filename.name)[1]
    valid_extentions = ['.pdf']
    if not ext.lower() in valid_extentions:
        return False
    return True

def is_file_exists(file):
    if file == None or file.url in [None, '']:

        return False
    if os.path.isfile(os.path.join(settings.BASE_DIR, file.url[1:])):
        return True
    return False

def _render(request, template, response):
	response['is_signed_in'] = request.user.is_authenticated()
	return render(request, template, response)

def _render_withstatus(request, template, response):
	response['is_signed_in'] = request.user.is_authenticated()
	profile = Appdata.objects.get(user=request.user)
	flags = Flag.objects.get(app_id=profile)
	response['status1'] = flags.application and flags.profile_pic
	response['status2'] = flags.annexure_obc and flags.annexure_parttime
	response['status3'] = all([flags.bacheoler_degree, flags.bacheoler_memo, flags.masters_degree, flags.masters_memo, flags.qualifying_scorecard, flags.caste_certi])
	response['status4'] = profile.paymentUploaded
	return render(request, template, response)


def index(request) :
	response = {}
	if 'Chrome' not in request.META['HTTP_USER_AGENT']:
		response['error'] = 'Looks like you are not using Google Chrome ! Using Chrome is mandatory to avoid technical issues !'
	return _render(request,'registration/login.djt',response)

def send_to_register(request,errorNo='0') :
	response = {}
	if 'Chrome' not in request.META['HTTP_USER_AGENT']:
		return redirect('/register')
	if errorNo=='1' :
		msg = 'Registration for selected position in selected department has already been done using this'
		msg = msg + ' Email-id'
		response['error'] = msg
	if errorNo=='2':
		response['error'] = 'Password should be a minimum of 8 Characters'
	if errorNo=='3' :
		response['error'] = 'Password do not match'
	response['depts'] = Department.objects.all()
	response['posts'] = Post.objects.all()
	return _render(request,'registration/register.djt',response)

def signin(request) :
	response = {}
	if request.method == 'POST':
		username = request.POST['username']
		password = request.POST['password']
		user = authenticate(username=username,password=password)
		if user is None :
			response['error'] = 'Login Failed. Username and Password didn\'t match.'
			return _render(request, 'registration/login.djt', response)
		elif 'next' in request.GET:
			return redirect(request.GET['next'])
		elif (is_hod(user) or is_dean(user)):
			login(request,user)
			user = request.user
			return redirect('/scrutiny')
		else :
			login(request,user)
			user = request.user
			profile = Appdata.objects.get(user=request.user)
			# if profile.termsRead :
			return redirect('/')
			# else :
			# 	return redirect('/register/termsandconditions')
	return redirect('/')

def signout(request):
	logout(request)
	return redirect('/')

@login_required(login_url='/register')
@is_applicant(login_url='/register')
def termsandconditions(request) :
	response = {}
	profile = Appdata.objects.get(user=request.user)
	response['profile'] = profile

	if request.method == 'POST' :
		profile.termsRead = True
		profile.save()

	if profile.termsRead :
		return redirect('/')
	else :
		return _render(request, 'registration/termsandconditions.djt', response)
	

def createApp(request) :
	response = {}
	if request.method == 'POST' :

		emailid = request.POST['email']
		dept = Department.objects.get(deptID=request.POST['dept'])
		appPost = Post.objects.get(id=request.POST['post'])
		if User.objects.filter(email=emailid).exists() :
			existingUsers = User.objects.filter(email=emailid)
			for existingUser in existingUsers :
				if Appdata.objects.filter(user=existingUser,post_for=appPost,post_in=dept).exists():
					response['error'] = 'Registration for selected position in selected department has already been done using this Email-ID'
					return _render(request, 'registration/login.djt', response)


		pass1 = request.POST['password1']
		pass2 = request.POST['password2']

		if len(pass1) < 8:
			response['error'] = 'Password should be a minimum of 8 Characters'
			return _render(request, 'registration/login.djt', response)
		if pass1 != pass2 :
			response['error'] = 'Passwords didn\'t match'
			return _render(request, 'registration/login.djt', response)
		else : 
			user = User()
			user.first_name = request.POST['firstName']
			user.last_name = request.POST['lastName']
			user.email = request.POST['email']

			#Application ID generation Logic
			p1 = 'PH'
			year = datetime.datetime.now().year
			yy = str(year)
			p2 = yy[2:]
			p3 = '0'
			p4 = str(dept.deptID).zfill(2)
			dept.appCount = dept.appCount + 1
			dept.save()
			p5 = str(dept.appCount).zfill(3)

			applicationID = p1+p2+p3+p4+p5
			#####

			user.username = applicationID
			user.set_password(pass1)
			user.save()
			user.groups.add(Group.objects.get(name="Applicant"))
			user.save()

			app_data = Appdata()
			app_data.user = user
			app_data.app_id = applicationID
			app_data.post_for = appPost
			app_data.post_in = dept
			app_data.scat = request.POST['scat']
			app_data.contact = request.POST['contact']
			app_data.unique_key = ''.join(random.choice(string.ascii_letters + string.digits) for char in xrange(20))
			app_data.save()

			profile = Appdata.objects.get(user=user)

			pay_data = PaymentDetails()
			pay_data.appID = profile
			pay_data.transID = request.POST['transID']
			pay_data.save()

			flags = Flag(app_id=profile)
			flags.save()
			
			#Mail application ID to applicant
			receiver = user.email
			sender = settings.EMAIL_HOST_USER
			content = 'Your Application ID is : '+applicationID+". Your username is same as your Application ID. Thanks for Registering."
			rlist = []
			rlist.append(receiver)
			try:
				send_mail('NIT WARANGAL - Username for PhD Admission portal registration',content,sender,rlist,fail_silently=False,)
			except:
				return HttpResponse('Your account has been created, but we couldn\'t send you a mail. Contact us immediately (support_admissions_2018@nitw.ac.in)')

			return _render(request,'registration/regDone.djt', {'email' : user.email})

	response['depts'] = Department.objects.all()
	response['posts'] = Post.objects.all()
	return _render(request,'registration/register.djt',response)


def forgotPassword(request):
	response = {}
	if request.method == 'POST':
		appID = request.POST['appID']
		if Appdata.objects.filter(app_id=appID).exists():
			appdata = Appdata.objects.get(app_id=appID)
			mailid = appdata.user.email
			newpass = ''.join(random.choice(string.ascii_uppercase + string.digits) for char in xrange(12))
			appdata.user.set_password(newpass)
			appdata.user.save()

			receiver = mailid
			sender = settings.EMAIL_HOST_USER
			content = 'Your new Password is : '+newpass
			rlist = []
			rlist.append(receiver)
			try:
				send_mail('NIT WARANGAL - Forgot Password request for PhD Admission portal',content,sender,rlist,fail_silently=False,)
			except BadHeaderError:
				return HttpResponse('Your password was reset, but we couldn\'t send you a mail. Contact us immediately (support_admissions_2018@nitw.ac.in)')

			uname, domain = mailid.split('@')
			response['emailId'] = uname[:4] + '*'*(len(uname)-4) + '@' + domain
			return _render(request,'registration/resetSucc.djt',response)

		else :
			response['error'] = 'Username is wrong or you haven\'t created an account yet.'

	return _render(request,'registration/forgotPass.djt',response)

@login_required(login_url='/register')
@is_applicant(login_url='/register')
def paymentDetails(request):
	response = {}
	profile = Appdata.objects.get(user=request.user)
	pay_data = PaymentDetails.objects.get(appID=profile)
	response['paydata'] = pay_data
	if request.method == 'POST' :
		pay_data.payDate = request.POST['paydate']
		pay_data.receipt = request.FILES['receipt']
		pay_data.payType = request.POST['paytype']
		if pay_data.payType == 'SC/ST/PWD':
			pay_data.amount = 'Rs.500'
		elif pay_data.payType == 'GEN/OBC':
			pay_data.amount = 'Rs.1000'
		
		if validateFormat(pay_data.receipt) :
			pay_data.save()
		else : 
			response['error'] = 'Only Pdf format is allowed'
			return _render(request,'registration/paymentDetails.djt',response)

		if is_file_exists(pay_data.receipt):
			app_data = Appdata.objects.get(user=request.user)
			app_data.paymentUploaded = True
			app_data.save()
			return redirect('/')
		else:
			response['error'] = 'Some error occured uploading receipt. Try again.'
			return _render(request,'registration/paymentDetails.djt',response)

	return _render_withstatus(request,'registration/paymentDetails.djt',response)