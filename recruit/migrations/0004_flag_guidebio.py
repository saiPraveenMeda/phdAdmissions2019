# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-10-13 16:06
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recruit', '0003_auto_20171013_2045'),
    ]

    operations = [
        migrations.AddField(
            model_name='flag',
            name='guidebio',
            field=models.BooleanField(default=False),
        ),
    ]
