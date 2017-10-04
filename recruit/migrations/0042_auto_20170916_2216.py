# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-16 22:16
from __future__ import unicode_literals

import django.core.validators
from django.db import migrations, models
import recruit.models


class Migration(migrations.Migration):

    dependencies = [
        ('recruit', '0041_auto_20170908_1842'),
    ]

    operations = [
        migrations.AddField(
            model_name='acad_annex_a',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_b',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_c',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_d',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_e12',
            name='annexure_file_e1',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_e12',
            name='annexure_file_e2',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_f',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_g',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_h',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_i',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_j',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_k',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_l',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_m',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_n',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_o',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_p',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_q',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_r',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_s',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_t',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_u',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_v',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_w1_w2',
            name='annexure_file_w1',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_w1_w2',
            name='annexure_file_w2',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_x',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_y',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
        migrations.AddField(
            model_name='acad_annex_z',
            name='annexure_file',
            field=models.FileField(blank=True, null=True, upload_to=recruit.models.get_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])]),
        ),
    ]
