# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-10-06 19:25
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('scrutiny', '0002_auto_20171007_0040'),
    ]

    operations = [
        migrations.AlterField(
            model_name='scrutinyuserprofile',
            name='department',
            field=models.CharField(max_length=50),
        ),
    ]
