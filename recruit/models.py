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

# class External_Sponsored_RnD(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_projects = models.IntegerField(default=0)
# 	project_as_PI = models.IntegerField(default=0)
# 	projects_not_pi = models.TextField(default = " ")
# 	total_patents = models.IntegerField(default=0)
# 	patents_as_pi = models.IntegerField(default=0)
# 	patents_not_pi = models.TextField(default = " ")
# 	credit_val = models.FloatField(default = 0)

# class Consultancy_Projects(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	consultancy_projects_completed = models.IntegerField()
# 	amount = models.IntegerField(default=0)
# 	credit_val = models.FloatField(default = 0)

# class PhD_Completed(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_phd = models.IntegerField(default=0)
# 	as_first_supervisor = models.IntegerField(default=0)
# 	phds = models.TextField(default = " ")
# 	credit_val = models.FloatField(default = 0)

# 	def __unicode__(self):
# 		return str(self.app_id.app_id)

# class Journal_Papers(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_journal_papers = models.IntegerField(default=0)
# 	as_first_supervisor = models.IntegerField(default=0)
# 	papers = models.TextField(default = " ")
# 	credit_val = models.FloatField(default = 0)

# class Conference_Paper_SCI(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_confernce_papers = models.IntegerField(default=0)
# 	as_first_supervisor = models.IntegerField(default=0)
# 	papers = models.TextField(default = " ")
# credit_val = models.FloatField(default = 0)

class Acad_Annex_A(models.Model):
	app_id = models.ForeignKey(Appdata)
	total_sem = models.IntegerField(default=0)
	annexure_data = models.TextField(default="[]")
	store = models.BooleanField(default = False)
	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

	def __unicode__(self):
		return str(self.app_id) + "_a";

class Acad_Annex_B(models.Model):
	app_id = models.ForeignKey(Appdata)
	total_sem = models.IntegerField(default=0)
	annexure_data = models.TextField(default="[]")
	store = models.BooleanField(default = False)
	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

	def __unicode__(self):
		return str(self.app_id) + "_b";

class Acad_Annex_C(models.Model):
	app_id = models.ForeignKey(Appdata)
	total_sem = models.IntegerField(default=0)
	annexure_data = models.TextField(default="[]")
	store = models.BooleanField(default = False)
	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

	def __unicode__(self):
		return str(self.app_id) + "_c";

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
		return str(self.app_id) + "_d";

# class Acad_Annex_E12(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_sem = models.IntegerField(default=0)
# 	annexure_data_e1 = models.TextField(default="[]")
# 	annexure_data_e2 = models.TextField(default="[]")
# 	store_e1 = models.BooleanField(default = False)
# 	store_e2 = models.BooleanField(default = False)
# 	total_e1 = models.FloatField(default=0)
# 	total_e2 = models.FloatField(default=0)
# 	credit_val = models.FloatField(default = 0)
# 	annexure_file_e1 = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)
# 	annexure_file_e2 = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_e12";

# class Acad_Annex_F(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_sem = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	store = models.BooleanField(default = False)
# 	credit_score = models.FloatField(default=0)
# 	credit_val = models.FloatField(default = 0)
# 	total = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_f";

# class Acad_Annex_G(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_sem = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	store = models.BooleanField(default = False)
# 	total = models.FloatField(default=0)
# 	credit_val = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_g";

# class Acad_Annex_H(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_sem = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	last_prom = models.CharField(default="",max_length=100)
# 	store = models.BooleanField(default = False)
# 	total = models.FloatField(default=0)
# 	credit_val = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_h";

# class Acad_Annex_I(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_sem = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	store = models.BooleanField(default = False)
# 	total = models.FloatField(default=0)
# 	credit_val = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)


# 	def __unicode__(self):
# 		return str(self.app_id) + "_i";

# class Acad_Annex_J(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_sem = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	credit_score = models.FloatField(default=0)
# 	last_prom = models.CharField(default="",max_length=100)
# 	tot_sem = models.IntegerField(default=0)
# 	store = models.BooleanField(default = False)
# 	credit_val = models.FloatField(default = 0)
# 	total = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_j";

# class Acad_Annex_K(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_sem = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	credit_score = models.FloatField(default=0)
# 	last_prom = models.CharField(default="",max_length=100)
# 	tot_sem = models.IntegerField(default=0)
# 	store = models.BooleanField(default = False)
# 	credit_val = models.FloatField(default = 0)
# 	total = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_k";

# class Acad_Annex_L(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_sem = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	credit_score = models.FloatField(default=0)
# 	last_prom = models.CharField(default="",max_length=100)
# 	tot_sem = models.IntegerField(default=0)
# 	store = models.BooleanField(default = False)
# 	credit_val = models.FloatField(default = 0)
# 	total = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_l";

# class Acad_Annex_M(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_sem = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	credit_score = models.FloatField(default=0)
# 	last_prom = models.CharField(default="",max_length=100)
# 	store = models.BooleanField(default = False)
# 	credit_val = models.FloatField(default = 0)
# 	total = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_m";

# class Acad_Annex_N(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_number = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	last_prom = models.CharField(default="",max_length=100)
# 	credit_val = models.FloatField(default = 0)
# 	store = models.BooleanField(default = False)
# 	total = models.FloatField(default=0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_n";


# class Acad_Annex_O(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	app_id = models.ForeignKey(Appdata)
# 	prog_2_week_duration = models.IntegerField(default=0)
# 	prog_1_week_duration = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	last_prom = models.CharField(default="",max_length=100)
# 	store = models.BooleanField(default = False)
# 	total = models.FloatField(default=0)
# 	credit_val = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_o";

# class Acad_Annex_P(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_number = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	last_prom = models.CharField(default="",max_length=100)
# 	store = models.BooleanField(default = False)
# 	total = models.FloatField(default=0)
# 	credit_val = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_p";

# class Acad_Annex_Q(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_years = models.IntegerField(default=0)
# 	total_months = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	total_exp_after_phd = models.IntegerField(default=0)
# 	total_exp_cur = models.IntegerField(default=0)
# 	total_exp = models.IntegerField(default=0) 
# 	credit_score = models.FloatField(default=0)
# 	last_prom = models.CharField(default="",max_length=100)
# 	store = models.BooleanField(default = False)
# 	total_yr = models.IntegerField(default = 0)
# 	total_mnth = models.IntegerField(default = 0)
# 	credit_val = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_q";

# class Acad_Annex_R(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_number = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	last_prom = models.CharField(default="",max_length=100)
# 	store = models.BooleanField(default = False)
# 	total = models.FloatField(default=0)
# 	credit_val = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_r";


# class Acad_Annex_S(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_credit = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	extra_load = models.IntegerField(default=0)
# 	credit_score = models.FloatField(default=0)
# 	last_prom = models.CharField(default="",max_length=100)
# 	avg_load = models.FloatField(default = 0)
# 	store = models.BooleanField(default = False)
# 	credit_val = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_s";


# class Acad_Annex_T(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_number = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	last_prom = models.CharField(default="",max_length=100)
# 	store = models.BooleanField(default = False)
# 	total = models.FloatField(default=0)
# 	credit_val = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_t";


# class Acad_Annex_U(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_number = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	last_prom = models.CharField(default="",max_length=100)
# 	store = models.BooleanField(default = False)
# 	total = models.FloatField(default=0)
# 	credit_val = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_u";

# class Acad_Annex_V(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_number = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	last_prom = models.CharField(default="",max_length=100)
# 	store = models.BooleanField(default = False)
# 	total = models.FloatField(default = 0)
# 	credit_val = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_v";


# class Acad_Annex_W1_W2(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_number = models.IntegerField(default=0)
# 	annexure_data1 = models.TextField(default="[]")
# 	annexure_data2 = models.TextField(default="[]")
# 	last_prom_w1 = models.CharField(default="",max_length=100)
# 	last_prom_w2 = models.CharField(default="",max_length=100)
# 	store_w1 = models.BooleanField(default = False)
# 	store_w2 = models.BooleanField(default = False)
# 	total_w1 = models.FloatField(default=0)
# 	total_w2 = models.FloatField(default=0)
# 	credit_val = models.FloatField(default = 0)
# 	annexure_file_w1 = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)
# 	annexure_file_w2 = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_w12";

# class Acad_Annex_X(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_number = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	last_prom = models.CharField(default="",max_length=100)
# 	store = models.BooleanField(default = False)
# 	credit_val = models.FloatField(default = 0)
# 	total = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_x";

# class Acad_Annex_Y(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_number = models.IntegerField(default=0)
# 	ieee = models.BooleanField(default=False)
# 	fna = models.BooleanField(default=False)
# 	fnae = models.BooleanField(default=False)
# 	fnasc = models.BooleanField(default=False)
# 	store = models.BooleanField(default = False)
# 	credit_score = models.FloatField(default=0)
# 	value = models.CharField(max_length=10, default="no")
# 	store = models.BooleanField(default = False)
# 	credit_val = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_y"

# class Acad_Annex_Z(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	total_number = models.IntegerField(default=0)
# 	annexure_data = models.TextField(default="[]")
# 	last_prom = models.CharField(default="",max_length=100)
# 	percentage = models.FloatField(default=0)
# 	store = models.BooleanField(default = False)
# 	credit_val = models.FloatField(default = 0)
# 	total = models.FloatField(default = 0)
# 	annexure_file = models.FileField(upload_to=get_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

# 	def __unicode__(self):
# 		return str(self.app_id) + "_z";

# class SubjectTaught(models.Model):
# 	app_id = models.ForeignKey(Appdata)
# 	level = models.CharField(max_length=10)
# 	courseType = models.CharField(max_length=30)
# 	data = models.TextField()
# 	credit_val = models.FloatField(default = 0)


# 	def __unicode__(self):
# 		return str(self.app_id.app_id+"-"+self.level+"-"+self.courseType)
