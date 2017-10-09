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
	return 'users/{0}/profilepic/{1}'.format(instance.app_id,filename)

def get_docpath(instance,filename):
	return 'users/{0}/documents/{1}'.format(instance.app_id.app_id,filename)

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
		return self.app_id + '\'s application'

class GeneralData(models.Model):
	app_id = models.ForeignKey(Appdata)
	full_name = models.CharField(max_length=200)
	gender = models.CharField(max_length=200)
	father_name = models.CharField(max_length=200)
	mother_name = models.CharField(max_length=200)
	nation = models.CharField(max_length=200)
	dob = models.DateField(default=datetime.date.today)
	age = models.IntegerField()
	permanent_addr = models.CharField(max_length=200)
	correspond_addr = models.CharField(max_length=200)
	category = models.CharField(max_length=10,blank=True)
	pwd = models.CharField(max_length=10,default='no')
	aadhaarNo = models.CharField(max_length=13,blank=True)

	def __unicode__(self):
		return self.app_id.app_id + '\'s GeneralData'

class QualifyingExam(models.Model):
	name = models.CharField(max_length=20)

	def __unicode__(self):
		return self.name


class Education(models.Model):
	app_id = models.ForeignKey(Appdata)
	degreeType = models.CharField(max_length=30)
	degreeName = models.CharField(max_length=100)
	university = models.CharField(max_length=200)
	passingYear = models.IntegerField()
	marks = models.CharField(max_length=10)
	division = models.CharField(max_length=100)

	def __unicode__(self):
		return self.app_id.app_id + '\'s ' + self.degreeType

class QualifyingExamDetails(models.Model):
	app_id = models.ForeignKey(Appdata)
	exam = models.ForeignKey(QualifyingExam)
	qualifyingYear = models.IntegerField()
	score = models.FloatField()
	rank = models.IntegerField()
	cutoffScore = models.FloatField()

	def __unicode__(self):
		return self.app_id.app_id + '\'s ' + self.exam

class Experience(models.Model):
	app_id = models.ForeignKey(Appdata)
	teaching_exp = models.CharField(max_length=5)
	research_exp = models.CharField(max_length=5)
	industrial_exp = models.CharField(max_length=5)

	def __unicode__(self):
		return self.app_id.app_id + '\'s experience'

class Research(models.Model):
	app_id = models.ForeignKey(Appdata)
	title = models.TextField(max_length=50)
	conference = models.TextField(max_length=50)
	link = models.TextField(max_length=50)

	def __unicode__(self):
		return self.app_id.app_id + '\'s papers'

class Other(models.Model):
	app_id = models.ForeignKey(Appdata)
	proposedFieldOfResearch = models.TextField(max_length=50)

	def __unicode__(self):
		return self.app_id.app_id + '\'s other details'

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
		return self.app_id.app_id + '\'s Annexure - OBC'

class Annexure_Part_Time(models.Model):
	app_id = models.ForeignKey(Appdata)
	name = models.CharField(max_length=30)
	designation = models.CharField(max_length=30)
	date = models.CharField(max_length=20)
	address = models.CharField(max_length=100)
	employment_years = models.CharField(max_length=5)

	def __unicode__(self):
		return self.app_id.app_id + '\'s Annexure - Part Time'

class Document(models.Model):
	app_id = models.ForeignKey(Appdata)
	UDegree = models.FileField(upload_to=get_docpath, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)
	UMemo = models.FileField(upload_to=get_docpath, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)
	MDegree = models.FileField(upload_to=get_docpath, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)
	MMemo = models.FileField(upload_to=get_docpath, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)
	CasteCertificate = models.FileField(upload_to=get_docpath, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)
	QualifyingExamScoreCard = models.FileField(upload_to=get_docpath, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

	def __unicode__(self):
		return self.app_id.app_id + '\'s Documents'

class Flag(models.Model):
	app_id = models.ForeignKey(Appdata)
	profile_pic = models.BooleanField(default=False)
	annexure_obc = models.BooleanField(default=False)
	annexure_parttime = models.BooleanField(default=False)
	bacheoler_degree = models.BooleanField(default=False)
	bacheoler_memo = models.BooleanField(default=False)
	masters_degree = models.BooleanField(default=False)
	masters_memo = models.BooleanField(default=False)
	caste_certi = models.BooleanField(default=False)
	qualifying_scorecard = models.BooleanField(default=False)
	application = models.BooleanField(default=False)

	def __unicode__(self):
		return self.app_id.app_id + '\'s flags'