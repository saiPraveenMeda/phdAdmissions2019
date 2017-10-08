# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.core.validators import FileExtensionValidator

def get_profilepic_path(instance,filename):
	return 'users/{0}/profilepic/{1}'.format(instance.applicationID,filename)

def get_pay_path(instance,filename):
	return 'users/{0}/payment/{1}'.format(instance.appID,filename)

class Department(models.Model):
	name = models.CharField(max_length=100)
	deptID = models.IntegerField()
	appCount = models.IntegerField()

	def __str__(self) :
		return self.name

class Post(models.Model):
	name = models.CharField(max_length=50)

	def __str__(self):
		return self.name


class PaymentDetails(models.Model) :
	appID = models.CharField(max_length=10)
	bankName = models.CharField(max_length=100,blank=True,null=True)
	transID = models.CharField(max_length=50)
	accountNum = models.CharField(max_length=30)
	payDate = models.DateField(blank=True,null=True)
	payType = models.CharField(max_length=10,blank=True,null=True)
	amount = models.CharField(max_length=10,blank=True,null=True)
	receipt = models.FileField(upload_to=get_pay_path, validators=[FileExtensionValidator(["pdf"])], null=True, blank=True)

	def __str__(self):
		return self.appID