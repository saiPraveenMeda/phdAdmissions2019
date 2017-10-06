# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User
from registration.models import Department

class ScrutinyUserProfile(models.Model):
	user = models.ForeignKey(User)
	department = models.CharField(max_length=50)

	def __str__(self):
		return (self.department+" - "+self.user.first_name+" "+self.user.last_name)
