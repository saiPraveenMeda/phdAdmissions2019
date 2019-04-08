# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-04-08 12:58
from __future__ import unicode_literals

import django.core.validators
from django.db import migrations, models
import recruit.models


class Migration(migrations.Migration):

    dependencies = [
        ('recruit', '0004_auto_20190407_1139'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='other',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_docpath, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='flag',
            name='other',
            field=models.BooleanField(default=False),
        ),
    ]
