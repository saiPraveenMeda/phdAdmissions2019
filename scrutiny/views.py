# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth.models import User
from contrib.auth.decorators import user_passes_test
from .models import UserProfile as ScrutinizerProfile
from registration.models import UserProfile as ApplicantProfile

def is_dean(user):
    return user.groups.filter(name="Dean").exists()
def is_hod(user):
    return user.groups.filter(name="HOD").exists()

@login_required(login_url='/register')
def index(request):
	userprofile = ScrutinizerProfile.objects.get(user=request.user)
	if is_dean(request.user):
		profiles = ApplicantProfile.objects.all()
	if is_hod(request.user):
		profiles = ApplicantProfile.objects.filter(departmentApplied=userprofile.department)
	response['profiles'] = profiles
	return render(request,'scrutiny/applications.djt',response)