# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-02 18:57
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recruit', '0010_auto_20170902_1816'),
    ]

    operations = [
        migrations.AddField(
            model_name='acad_annex_z',
            name='last_prom',
            field=models.CharField(default='', max_length=100),
        ),
    ]
