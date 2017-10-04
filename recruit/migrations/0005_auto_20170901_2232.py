# -*- coding: utf-8 -*-
# Generated by Django 1.10.4 on 2017-09-01 22:32
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('recruit', '0004_auto_20170901_2219'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='facuser',
            name='user',
        ),
        migrations.AddField(
            model_name='appdata',
            name='user',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]
