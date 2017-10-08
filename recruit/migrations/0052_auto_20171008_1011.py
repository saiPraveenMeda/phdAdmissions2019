# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-10-08 04:41
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('recruit', '0051_appdata_verified'),
    ]

    operations = [
        migrations.CreateModel(
            name='Annexure_OBC',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('gender', models.CharField(max_length=10)),
                ('parent_name', models.CharField(max_length=30)),
                ('village', models.CharField(max_length=30)),
                ('district', models.CharField(max_length=30)),
                ('state', models.CharField(max_length=30)),
                ('community', models.CharField(max_length=30)),
                ('app_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruit.Appdata')),
            ],
        ),
        migrations.RemoveField(
            model_name='acad_annex_a',
            name='app_id',
        ),
        migrations.RemoveField(
            model_name='acad_annex_b',
            name='app_id',
        ),
        migrations.RemoveField(
            model_name='acad_annex_c',
            name='app_id',
        ),
        migrations.RemoveField(
            model_name='acad_annex_d',
            name='app_id',
        ),
        migrations.DeleteModel(
            name='Acad_Annex_A',
        ),
        migrations.DeleteModel(
            name='Acad_Annex_B',
        ),
        migrations.DeleteModel(
            name='Acad_Annex_C',
        ),
        migrations.DeleteModel(
            name='Acad_Annex_D',
        ),
    ]