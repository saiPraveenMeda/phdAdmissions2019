# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-03 05:47
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recruit', '0016_merge_20170903_0450'),
    ]

    operations = [
        migrations.RenameField(
            model_name='acad_annex_w1_w2',
            old_name='last_prom',
            new_name='last_prom_w1',
        ),
        migrations.AddField(
            model_name='acad_annex_w1_w2',
            name='last_prom_w2',
            field=models.CharField(default='', max_length=100),
        ),
    ]
