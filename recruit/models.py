# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import datetime
from django.db import models
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from django.core.validators import FileExtensionValidator

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
	post_for = models.CharField(max_length=200)
	post_in = models.CharField(max_length=200)
	specialize = models.CharField(max_length=200)
	# agp1 = models.BooleanField(default=True)
	# agp2 = models.BooleanField(default=False)
	# agp3 = models.BooleanField(default=False)
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

class Research(models.Model):
	app_id = models.ForeignKey(Appdata)
	research_publ = models.TextField()
	research_proj = models.TextField()
	pg = models.IntegerField()
	phd = models.IntegerField()

class Other(models.Model):
	app_id = models.ForeignKey(Appdata)
	patent = models.TextField()
	consultancy = models.TextField()
	admin_resp_held = models.TextField()
	minimum_pay_exp = models.IntegerField()
	time_req = models.IntegerField()
	honor = models.TextField()

class Paper(models.Model):
	app_id = models.ForeignKey(Appdata)
	paper1 = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)
	paper2 = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)
	paper3 = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)
	paper4 = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)
	paper5 = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)
	cvpaper = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

	def __unicode__(self):
		return self.app_id.app_id

class Referral(models.Model):
	app_id = models.ForeignKey(Appdata)
	ref_data = models.TextField()

	def __unicode__(self):
		return str(self.app_id.app_id)

class Acad_Annex_A(models.Model):
	app_id = models.ForeignKey(Appdata)
	total_sem = models.IntegerField(default=0)
	annexure_data = models.TextField(default="[]")
	store = models.BooleanField(default = False)
	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

	def __unicode__(self):
		return str(self.app_id) + "_a"

class Acad_Annex_B(models.Model):
	app_id = models.ForeignKey(Appdata)
	total_sem = models.IntegerField(default=0)
	annexure_data = models.TextField(default="[]")
	store = models.BooleanField(default = False)
	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

	def __unicode__(self):
		return str(self.app_id) + "_b"

class Acad_Annex_C(models.Model):
	app_id = models.ForeignKey(Appdata)
	total_sem = models.IntegerField(default=0)
	annexure_data = models.TextField(default="[]")
	store = models.BooleanField(default = False)
	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

	def __unicode__(self):
		return str(self.app_id) + "_c"

class Acad_Annex_D(models.Model):
	app_id = models.ForeignKey(Appdata)
	basic_pay_r = models.IntegerField(default=0)
	payband_r = models.IntegerField(default=0)
	payband_end_r =models.IntegerField(default=0)
	total_r = models.IntegerField(default=0)
	basic_pay_d = models.IntegerField(default=0)
	payband_d = models.IntegerField(default=0)
	payband_end_d =models.IntegerField(default=0)
	total_d = models.IntegerField(default=0)
	store = models.BooleanField(default = False)
	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

	def __unicode__(self):
		return str(self.app_id) + "_d"