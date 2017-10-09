# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.core.validators import FileExtensionValidator


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