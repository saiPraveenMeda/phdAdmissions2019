# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.core.validators import FileExtensionValidator , MinValueValidator

def get_profilepic_path(instance,filename):
	return 'users/{0}/profilepic/{1}'.format(instance.applicationID,filename)


class profile(models.Model):
	user = models.ForeignKey(User)
	applicationID = models.CharField(max_length=10)
	contact = models.CharField(max_length=14)
	departmentApplied = models.CharField(max_length=50)
	postApplied = models.CharField(max_length=100)
	termsRead = models.BooleanField(default=False)
	profilePic = models.ImageField(upload_to=get_profilepic_path,null=True,blank=True)

	def __str__(self):
		return (self.applicationID+"-"+self.user.first_name+" "+self.user.last_name)

class generalData(models.Model):
	user = models.ForeignKey(User)
	full_name = models.CharField(max_length=250)
	gender = models.CharField(max_length=6)
	father_name = models.CharField(max_length=250)
	father_occ = models.CharField(max_length=100)
	mother_name = models.CharField(max_length=250)
	mother_occ = models.CharField(max_length=100)
	nation = models.CharField(max_length=50)
	pob = models.CharField(max_length=100)
	dob = models.DateField(blank=True,null=True)
	age = models.CharField(max_length=2)
	aadharNo = models.CharField(max_length=20)
	correspond_addr = models.CharField(max_length=250)
	permanent_addr = models.CharField(max_length=250)
	category = models.CharField(max_length=20)
	pwd = models.BooleanField(default=False)

class Bqual(models.Model):
	user = models.ForeignKey(User)
	degreeName = models.CharField(max_length=100)
	university = models.CharField(max_length=200)
	passingYear = models.IntegerField()
	marks = models.CharField(max_length=5)
	division = models.CharField(max_length=10)


class Mqual(models.Model):
	user = models.ForeignKey(User)
	degreeName = models.CharField(max_length=100)
	university = models.CharField(max_length=200)
	passingYear = models.IntegerField()
	marks = models.CharField(max_length=5)
	division = models.CharField(max_length=10)


class Experience(models.Model):
	user = models.ForeignKey(User)
	teaching_exp = models.IntegerField(validators=[MinValueValidator(0)])
	postPhd_exp = models.IntegerField(validators=[MinValueValidator(0)])
	research_exp = models.IntegerField(validators=[MinValueValidator(0)])
	industrial_exp = models.IntegerField(validators=[MinValueValidator(0)])
	teaching_exp = models.IntegerField(validators=[MinValueValidator(0)])
	postPhd_exp = models.IntegerField(validators=[MinValueValidator(0)])

class texp(models.Model):
	user = models.ForeignKey(User)
	organization = models.CharField(max_length=100)
	designation = models.CharField(max_length=100)
	joiningDate = models.DateField(blank=True,null=True)
	leavingDate = models.DateField(blank=True,null=True)
	pay = models.IntegerField(validators=[MinValueValidator(0)])
	service = models.CharField(max_length=100)

class rexp(models.Model):
	user = models.ForeignKey(User)
	organization = models.CharField(max_length=100)
	designation = models.CharField(max_length=100)
	joiningDate = models.DateField(blank=True,null=True)
	leavingDate = models.DateField(blank=True,null=True)
	pay = models.IntegerField(validators=[MinValueValidator(0)])
	service = models.CharField(max_length=100)
	
class iexp(models.Model):
	user = models.ForeignKey(User)
	organization = models.CharField(max_length=100)
	designation = models.CharField(max_length=100)
	joiningDate = models.DateField(blank=True,null=True)
	leavingDate = models.DateField(blank=True,null=True)
	pay = models.IntegerField(validators=[MinValueValidator(0)])
	service = models.CharField(max_length=100)

