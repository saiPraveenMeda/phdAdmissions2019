from __future__ import unicode_literals
from django.conf import settings
from django.shortcuts import render, render_to_response, redirect
from django.http import HttpResponse, HttpResponseRedirect, HttpRequest, Http404,JsonResponse
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required,user_passes_test
from django.contrib.auth.models import User, Group
from recruit.models import Appdata
import random, string
from .models import *
import datetime
from django.core.mail import send_mail
import smtplib
import os
import unicodedata

def is_dean(user):
    return user.groups.filter(name="Dean").exists()
def is_hod(user):
    return user.groups.filter(name="HOD").exists()


def index(request) :
	response = {}
	return render(request,'registration/login.djt',response)

def send_to_register(request,errorNo='0') :
	response = {}
	if errorNo=='1' :
		msg = 'Registration for selected position in selected department has already been done using this'
		msg = msg + ' Email-id'
		response['error'] = msg
	if errorNo=='2' :
		response['error'] = 'Password do not match'
	response['depts'] = Department.objects.all()
	response['posts'] = Post.objects.all()
	return render(request,'registration/register.djt',response)

def signin(request) :
	response = {}
	if request.method == 'POST':
		username = request.POST['username']
		password = request.POST['password']
		user = authenticate(username=username,password=password)
		if user is None :
			return render(request, 'registration/login.djt', response)
		elif (is_hod(user) or is_dean(user)):
			login(request,user)
			user = request.user
			return redirect('/scrutiny')
		else :
			login(request,user)
			user = request.user
			profile = UserProfile.objects.get(user=request.user)
			if profile.termsRead :
				return redirect('/')
			else :
				return redirect('/register/termsandconditions')
	return redirect('/')

def signout(request):
	logout(request)
	return redirect('/register')

def termsandconditions(request) :
	response = {}
	profile = UserProfile.objects.get(user=request.user)
	response['profile'] = profile

	if request.method == 'POST' :
		profile.termsRead = True
		profile.save()

	if profile.termsRead :
		return redirect('/')
	else :
		return render(request, 'registration/termsandconditions.djt', response)
	

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
					return redirect('/register/signup/1')

		pass1 = request.POST['password1']
		pass2 = request.POST['password2']
		if pass1 != pass2 :
			return redirect('/register/signup/2')
		else : 
			user = User()
			user.first_name = request.POST['firstName']
			user.last_name = request.POST['lastName']
			user.email = request.POST['email']

			#Application ID generation Logic
			p1 = 'PH'
			from datetimeyear = datetime.datetime.now().year
			yy = str(year)
			p2 = yy[2:]
			p3 = '1'
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
			app_data.contact = request.POST['contact']
			app_data.termsRead = False
			app_data.save()

			pay_data = PaymentDetails()
			pay_data.appID = applicationID
			pay_data.transID = request.POST['transID']
			pay_data.save()
			
			#Mail application ID to applicant
			receiver = user.email
			sender = 'support_admissions_2017@nitw.ac.in'
			content = 'Your Application ID is : '+applicationID+"\nYour username is same as your Application ID. Thanks for Registering."
			rlist = []
			rlist.append(receiver)
			try:
				send_mail('NIT WARANGAL - Application Id for PhD Admission portal registration',content,sender,rlist,fail_silently=False,)
			except BadHeaderError:
				return HttpResponse('Invalid header found.')

			return render(request,'registration/regDone.djt', {'email' : user.email})

	return redirect('/register/signup')

def uploadpic(request):
	response = {}
	profile = UserProfile.objects.get(user=request.user)
	response['profile'] = profile
	if request.method == 'POST' :
		file = request.FILES['profilepic']
		profile.profilePic = file
		profile.save()
		return redirect('/')
	return render(request,'registration/uploadpic.djt',response)


def forgotPassword(request):
	response = {}
	if request.method == 'POST':
		appID = request.POST['appID']
		if Appdata.objects.filter(app_id=appID).exists():
			appdata = Appdata.objects.filter(app_id=appID)
			mailid = appdata.user.email
			newpass = ''.join(random.choice(string.ascii_uppercase + string.digits) for char in xrange(12))
			appdata.user.set_password(newpass)
			appdata.user.save()

			receiver = mailid
			sender = 'support_admissions_2017@nitw.ac.in'
			content = 'Your new Password is : '+newpass
			rlist = []
			rlist.append(receiver)
			try:
				send_mail('NIT WARANGAL - Forgot Password request for PhD Admission portal',content,sender,rlist,fail_silently=False,)
			except BadHeaderError:
				return HttpResponse('Invalid header found.')

			response['emailId'] = mailid[:5]+'*****'+mailid.split('@')[1]
			return render(request,'registration/resetSucc.djt',response)

		else :
			response['error'] = 'Application-ID is wrong'
	return render(request,'registration/forgotPass.djt',response)

def paymentDetails(request):
	response = {}
	profile = UserProfile.objects.get(user=request.user)
	pay_data = PaymentDetails.objects.get(appID=profile.applicationID)
	response['paydata'] = pay_data
	if request.method == 'POST' :
		pay_data.bankName = request.POST['bank']
		pay_data.accountNum = request.POST['account']
		pay_data.payDate = request.POST['paydate']
		pay_data.receipt = request.FILES['receipt']
		pay_data.payType = request.POST['paytype']
		if pay_data.payType == 'SC/ST/PWD':
			pay_data.amount = 'Rs.500'
		elif pay_data.payType == 'GEN/OBC':
			pay_data.amount = 'Rs.1000'
		
		if validateFormat(pay_data.receipt) :
			pay_data.save()
			app_data = Appdata.objects.get(user=request.user)
			app_data.paymentUploaded = True
			app_data.save()
		else : 
			response['error'] = 'Only Pdf format is allowed'
			return render(request,'registration/paymentDetails.djt',response)

		return redirect('/')

	return render(request,'registration/paymentDetails.djt',response)

def validateFormat(filename):
    ext = os.path.splitext(filename.name)[1]
    valid_extentions = ['.pdf']
    if not ext in valid_extentions:
        return False
    return True