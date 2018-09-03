# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from datetime import datetime, timedelta

# Create your models here.
class Category(models.Model):
	name = models.CharField(max_length=300)
	start_date = models.DateTimeField(default=datetime.now())
	end_date = models.DateTimeField(default=datetime.now()+timedelta(days=10))