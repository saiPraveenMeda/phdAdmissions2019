# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-10-13 15:11
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recruit', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='annexure_part_time',
            name='guide',
            field=models.CharField(default='vamsi', max_length=100),
            preserve_default=False,
        ),
    ]
