# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-10-10 07:49
from __future__ import unicode_literals

import django.core.validators
from django.db import migrations, models
import recruit.models


class Migration(migrations.Migration):

    dependencies = [
        ('recruit', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='PWDCertificate',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_docpath, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='flag',
            name='pwd_certi',
            field=models.BooleanField(default=False),
        ),
    ]