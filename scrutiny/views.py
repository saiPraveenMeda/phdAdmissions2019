# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required, user_passes_test
from .models import ScrutinyUserProfile as ScrutinizerProfile
from registration.models import UserProfile as ApplicantProfile

def is_dean(user):
    return user.groups.filter(name="Dean").exists()
def is_hod(user):
    return user.groups.filter(name="HOD").exists()
def is_scrutinizer(login_url=None):
	return user_passes_test(lambda u: (is_hod(u) or is_dean(u)), login_url=login_url)

@login_required(login_url='/register')
@is_scrutinizer(login_url='/register')
def index(request):
	userprofile = ScrutinizerProfile.objects.get(user=request.user)
	if is_dean(request.user):
		profiles = ApplicantProfile.objects.all()
	elif is_hod(request.user):
		profiles = ApplicantProfile.objects.filter(departmentApplied=userprofile.department)

	response['profiles'] = profiles
	return render(request,'scrutiny/applications.djt',response)