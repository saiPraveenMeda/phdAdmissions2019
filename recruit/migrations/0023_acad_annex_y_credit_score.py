# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-03 17:30
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recruit', '0022_auto_20170903_1448'),
    ]

    operations = [
        migrations.AddField(
            model_name='acad_annex_y',
            name='credit_score',
            field=models.IntegerField(default=0),
        ),
    ]
