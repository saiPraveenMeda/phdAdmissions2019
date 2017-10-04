# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-02 12:00
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('recruit', '0006_facuser_mother_occ'),
    ]

    operations = [
        migrations.CreateModel(
            name='Qualification',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('degreeType', models.CharField(max_length=10)),
                ('degreeName', models.CharField(max_length=30)),
                ('university', models.CharField(max_length=200)),
                ('passingYear', models.IntegerField()),
                ('marks', models.CharField(max_length=10)),
                ('division', models.CharField(max_length=10)),
                ('app_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruit.Appdata')),
            ],
        ),
        migrations.AddField(
            model_name='experience',
            name='postPhd_exp',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='facuser',
            name='category',
            field=models.CharField(blank=True, max_length=10),
        ),
        migrations.AddField(
            model_name='facuser',
            name='pwd',
            field=models.CharField(default='no', max_length=10),
        ),
    ]
