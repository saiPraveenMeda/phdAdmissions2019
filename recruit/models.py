# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import datetime
from django.db import models
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from django.core.validators import FileExtensionValidator
from registration.models import *

def get_profilepic_path(instance,filename):
	return 'users/{0}/profilepic/{1}'.format(instance.applicationID,filename)

def get_path(instance,filename):
	return 'users/{0}/papers/{1}'.format(instance.app_id.app_id,filename)

def validate(value):
	import os
	ext = os.path.splitext(value.name)[1]
	valid_extentions = ['.pdf']
	if not ext in valid_extentions:
	    raise ValidationError(u'File type is not supported')

# Create your models here.
class Appdata(models.Model):
	app_id = models.CharField(max_length=10,primary_key=True)
	user = models.ForeignKey(User, default=None)
	post_for = models.ForeignKey(Post)
	post_in = models.ForeignKey(Department)
	contact = models.CharField(max_length=14)
	profilePic = models.ImageField(upload_to=get_profilepic_path,null=True,blank=True)
	termsRead = models.BooleanField(default=False)
	submitted = models.BooleanField(default=False)
	verified = models.BooleanField(default=False)
	paymentUploaded = models.BooleanField(default=False)
	submitDate = models.DateTimeField(blank=True,default=datetime.datetime.now,auto_now=False, auto_now_add=False)

	def __unicode__(self):
		return str(self.app_id)

class FacUser(models.Model):
	app_id = models.ForeignKey(Appdata)
	full_name = models.CharField(max_length=200)
	gender = models.CharField(max_length=200)
	father_name = models.CharField(max_length=200)
	father_occ = models.CharField(max_length=200)
	mother_name = models.CharField(max_length=200)
	mother_occ = models.CharField(max_length=200,blank=True)
	nation = models.CharField(max_length=200)
	pob = models.CharField(max_length=200)
	dob = models.DateField(default=datetime.date.today)
	age = models.IntegerField()
	permanent_addr = models.CharField(max_length=200)
	correspond_addr = models.CharField(max_length=200)
	category = models.CharField(max_length=10,blank=True)
	pwd = models.CharField(max_length=10,default='no')
	aadhaarNo = models.CharField(max_length=13,blank=True)

	def __unicode__(self):
		return self.full_name


class Education(models.Model):
	app_id = models.ForeignKey(Appdata)
	education = models.TextField()
	abstract_thesis = models.TextField()
	any_other_info = models.TextField()
	sports_extra = models.TextField()
	lang = models.TextField()

class Qualification(models.Model):
	app_id = models.ForeignKey(Appdata)
	degreeType = models.CharField(max_length=10)
	degreeName = models.CharField(max_length=100)
	university = models.CharField(max_length=200)
	passingYear = models.IntegerField()
	marks = models.CharField(max_length=10)
	division = models.CharField(max_length=100)

	def __unicode__(self):
		return str(self.app_id.app_id+"-"+self.degreeType)

class Experience(models.Model):
	app_id = models.ForeignKey(Appdata)
	teaching_exp = models.IntegerField()
	postPhd_exp = models.IntegerField(default=0)
	teaching_data = models.TextField()
	research_exp = models.IntegerField()
	research_data = models.TextField()
	industrial_exp = models.IntegerField()
	industrial_data = models.TextField()

	def __unicode__(self):
		return str(self.app_id)


class Annexure_OBC(models.Model):
	app_id = models.ForeignKey(Appdata)
	name = models.CharField(max_length=30)
	gender = models.CharField(max_length=10)
	parent_name = models.CharField(max_length=30)
	village = models.CharField(max_length=30)
	district = models.CharField(max_length=30)
	state = models.CharField(max_length=30)
	community = models.CharField(max_length=30)

	def __unicode__(self):
		return str(self.app_id) + "_obc"

class Annexure_PartTime(models.Model):
	app_id = models.ForeignKey(Appdata)
	name = models.CharField(max_length=30)
	designation = models.CharField(max_length=30)
	date = models.CharField(max_length=20)
	address = models.CharField(max_length=100)
	employment_years = models.CharField(max_length=5)

	def __unicode__(self):
		return str(self.app_id) + "_parttime"

class Flags(models.Model):
	bacheoler_degree = models.BooleanField(default=False)
	bacheoler_memo = models.BooleanField(default=False)
	masters_degree = models.BooleanField(default=False)
	masters_memo = models.BooleanField(default=False)
	caste = models.BooleanField(default=False)
	qualifying_scorecard = models.BooleanField(default=False)
	application = models.BooleanField(default=False)