# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-10-10 08:22
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recruit', '0002_auto_20171010_1319'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='paymentdetails',
            name='accountNum',
        ),
        migrations.RemoveField(
            model_name='paymentdetails',
            name='bankName',
        ),
        migrations.AlterField(
            model_name='annexure_obc',
            name='community',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='annexure_obc',
            name='district',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='annexure_obc',
            name='name',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='annexure_obc',
            name='parent_name',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='annexure_obc',
            name='state',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterField(
            model_name='annexure_obc',
            name='village',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='annexure_part_time',
            name='address',
            field=models.CharField(max_length=300),
        ),
        migrations.AlterField(
            model_name='annexure_part_time',
            name='designation',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterField(
            model_name='annexure_part_time',
            name='name',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='education',
            name='degreeType',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='education',
            name='division',
            field=models.CharField(max_length=30),
        ),
        migrations.AlterField(
            model_name='education',
            name='university',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='generaldata',
            name='correspond_addr',
            field=models.CharField(max_length=300),
        ),
        migrations.AlterField(
            model_name='generaldata',
            name='father_name',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='generaldata',
            name='full_name',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='generaldata',
            name='gender',
            field=models.CharField(max_length=20),
        ),
        migrations.AlterField(
            model_name='generaldata',
            name='mother_name',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='generaldata',
            name='nation',
            field=models.CharField(max_length=20),
        ),
        migrations.AlterField(
            model_name='generaldata',
            name='permanent_addr',
            field=models.CharField(max_length=300),
        ),
        migrations.AlterField(
            model_name='research',
            name='conference',
            field=models.TextField(max_length=100),
        ),
        migrations.AlterField(
            model_name='research',
            name='title',
            field=models.TextField(max_length=100),
        ),
    ]