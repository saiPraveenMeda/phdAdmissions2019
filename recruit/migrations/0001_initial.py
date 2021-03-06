# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-04-10 08:11
from __future__ import unicode_literals

from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
import recruit.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('registration', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Annexure_OBC',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('gender', models.CharField(max_length=10)),
                ('parent_name', models.CharField(max_length=100)),
                ('village', models.CharField(max_length=100)),
                ('district', models.CharField(max_length=100)),
                ('state', models.CharField(max_length=50)),
                ('community', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Annexure_Part_Time',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('designation', models.CharField(max_length=50)),
                ('date', models.CharField(max_length=50)),
                ('address', models.CharField(max_length=300)),
                ('employment_years', models.CharField(max_length=20)),
                ('guide', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Appdata',
            fields=[
                ('app_id', models.CharField(max_length=15, primary_key=True, serialize=False)),
                ('unique_key', models.CharField(max_length=21)),
                ('contact', models.CharField(max_length=14)),
                ('profilePic', models.ImageField(blank=True, null=True, upload_to=recruit.models.get_profilepic_path)),
                ('termsRead', models.BooleanField(default=False)),
                ('submitted', models.BooleanField(default=False)),
                ('verified', models.BooleanField(default=False)),
                ('shortlisted', models.BooleanField(default=False)),
                ('remark', models.CharField(default='', max_length=300)),
                ('paymentUploaded', models.BooleanField(default=False)),
                ('submitDate', models.DateTimeField(blank=True, default=django.utils.timezone.now)),
                ('post_for', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='registration.Post')),
                ('post_in', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='registration.Department')),
                ('user', models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Document',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('SSC', models.FileField(blank=True, null=True, upload_to=recruit.models.get_docpath, validators=[django.core.validators.FileExtensionValidator(['pdf'])])),
                ('Intermediate', models.FileField(blank=True, null=True, upload_to=recruit.models.get_docpath, validators=[django.core.validators.FileExtensionValidator(['pdf'])])),
                ('UDegree', models.FileField(blank=True, null=True, upload_to=recruit.models.get_docpath, validators=[django.core.validators.FileExtensionValidator(['pdf'])])),
                ('UMemo', models.FileField(blank=True, null=True, upload_to=recruit.models.get_docpath, validators=[django.core.validators.FileExtensionValidator(['pdf'])])),
                ('MDegree', models.FileField(blank=True, null=True, upload_to=recruit.models.get_docpath, validators=[django.core.validators.FileExtensionValidator(['pdf'])])),
                ('MMemo', models.FileField(blank=True, null=True, upload_to=recruit.models.get_docpath, validators=[django.core.validators.FileExtensionValidator(['pdf'])])),
                ('CasteCertificate', models.FileField(blank=True, null=True, upload_to=recruit.models.get_docpath, validators=[django.core.validators.FileExtensionValidator(['pdf'])])),
                ('QualifyingExamScoreCard', models.FileField(blank=True, null=True, upload_to=recruit.models.get_docpath, validators=[django.core.validators.FileExtensionValidator(['pdf'])])),
                ('PWDCertificate', models.FileField(blank=True, null=True, upload_to=recruit.models.get_docpath, validators=[django.core.validators.FileExtensionValidator(['pdf'])])),
                ('GuideBio', models.FileField(blank=True, null=True, upload_to=recruit.models.get_docpath, validators=[django.core.validators.FileExtensionValidator(['pdf'])])),
                ('app_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruit.Appdata')),
            ],
        ),
        migrations.CreateModel(
            name='Education',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('degreeType', models.CharField(max_length=100)),
                ('degreeName', models.CharField(max_length=100)),
                ('university', models.CharField(max_length=100)),
                ('passingYear', models.IntegerField()),
                ('marks', models.CharField(max_length=50)),
                ('division', models.CharField(max_length=100)),
                ('app_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruit.Appdata')),
            ],
        ),
        migrations.CreateModel(
            name='Experience',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('teaching_exp', models.CharField(max_length=5)),
                ('research_exp', models.CharField(max_length=5)),
                ('industrial_exp', models.CharField(max_length=5)),
                ('app_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruit.Appdata')),
            ],
        ),
        migrations.CreateModel(
            name='Flag',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('profile_pic', models.BooleanField(default=False)),
                ('annexure_obc', models.BooleanField(default=False)),
                ('annexure_parttime', models.BooleanField(default=False)),
                ('ssc', models.BooleanField(default=False)),
                ('intermediate', models.BooleanField(default=False)),
                ('bacheoler_degree', models.BooleanField(default=False)),
                ('bacheoler_memo', models.BooleanField(default=False)),
                ('masters_degree', models.BooleanField(default=False)),
                ('masters_memo', models.BooleanField(default=False)),
                ('caste_certi', models.BooleanField(default=False)),
                ('pwd_certi', models.BooleanField(default=False)),
                ('qualifying_scorecard', models.BooleanField(default=False)),
                ('papers', models.BooleanField(default=False)),
                ('guidebio', models.BooleanField(default=False)),
                ('application', models.BooleanField(default=False)),
                ('app_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruit.Appdata')),
            ],
        ),
        migrations.CreateModel(
            name='GeneralData',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('full_name', models.CharField(max_length=100)),
                ('gender', models.CharField(max_length=20)),
                ('father_name', models.CharField(max_length=100)),
                ('mother_name', models.CharField(max_length=100)),
                ('nation', models.CharField(max_length=20)),
                ('dob', models.DateField(default=django.utils.timezone.now)),
                ('age', models.IntegerField()),
                ('permanent_addr', models.CharField(max_length=300)),
                ('correspond_addr', models.CharField(max_length=300)),
                ('category', models.CharField(blank=True, max_length=10)),
                ('pwd', models.CharField(default='no', max_length=10)),
                ('aadhaarNo', models.CharField(blank=True, max_length=13)),
                ('app_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruit.Appdata')),
            ],
        ),
        migrations.CreateModel(
            name='Other',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('proposedFieldOfResearch', models.TextField(max_length=50)),
                ('app_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruit.Appdata')),
            ],
        ),
        migrations.CreateModel(
            name='PaymentDetails',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('transID', models.CharField(max_length=50)),
                ('payDate', models.DateField(blank=True, null=True)),
                ('payType', models.CharField(blank=True, max_length=10, null=True)),
                ('amount', models.CharField(blank=True, max_length=10, null=True)),
                ('receipt', models.FileField(blank=True, null=True, upload_to=recruit.models.get_pay_path, validators=[django.core.validators.FileExtensionValidator(['pdf'])])),
                ('appID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruit.Appdata')),
            ],
        ),
        migrations.CreateModel(
            name='QualifyingExam',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
                ('type', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='QualifyingExamDetails',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qualifyingYear', models.IntegerField()),
                ('score', models.FloatField()),
                ('rank', models.IntegerField()),
                ('cutoffScore', models.FloatField()),
                ('app_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruit.Appdata')),
                ('exam', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruit.QualifyingExam')),
            ],
        ),
        migrations.CreateModel(
            name='Research',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.TextField(max_length=100)),
                ('conference', models.TextField(max_length=100)),
                ('link', models.FileField(blank=True, null=True, upload_to=recruit.models.get_paperpath, validators=[django.core.validators.FileExtensionValidator(['pdf'])])),
                ('app_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruit.Appdata')),
            ],
        ),
        migrations.AddField(
            model_name='annexure_part_time',
            name='app_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruit.Appdata'),
        ),
        migrations.AddField(
            model_name='annexure_obc',
            name='app_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recruit.Appdata'),
        ),
    ]
