# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-10-06 18:28
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0009_auto_20170917_0856'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='post',
            name='postID',
        ),
    ]
