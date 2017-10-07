# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required, user_passes_test
from .models import ScrutinyUserProfile as ScrutinizerProfile
from recruit.models import Appdata
from registration.models import UserProfile
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
		applns = Appdata.objects.all()
		
	elif is_hod(request.user):
		isDean = False
		applns = Appdata.objects.filter(post_in=userprofile.department.name)
    
    # users = UserProfile.objects.filter(user__in=applns.values_list(user, flat=True))

	# response['applns'] = zip(applns, users)
	response['applns'] = applns
	response['is_dean'] = isDean
	return render(request,'scrutiny/applications.djt',response)