# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-04-12 07:34
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('payment', '0002_auto_20180412_1255'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='end_date',
            field=models.DateTimeField(default=datetime.datetime(2018, 4, 22, 13, 4, 19, 431409)),
        ),
        migrations.AlterField(
            model_name='category',
            name='start_date',
            field=models.DateTimeField(default=datetime.datetime(2018, 4, 12, 13, 4, 19, 431345)),
        ),
    ]
