# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from recruit.models import *

class AppdataAdmin(admin.ModelAdmin):
	list_display = ('app_id', 'post_for', 'post_in', 'submitted', 'verified')
	search_fields = ('app_id',)
	list_filter = ('post_for', 'post_in', 'submitted', 'verified')

class PaymentDetailsAdmin(admin.ModelAdmin):
	search_fields = ('appID',)

class GeneralDataAdmin(admin.ModelAdmin):
	search_fields = ('app_id', 'full_name')

class QualifyingExamAdmin(admin.ModelAdmin):
	list_filter = ('type',)

class EducationAdmin(admin.ModelAdmin):
	search_fields = ('app_id',)

class QualifyingExamDetailsAdmin(admin.ModelAdmin):
	search_fields = ('app_id',)

class ExperienceAdmin(admin.ModelAdmin):
	search_fields = ('app_id',)

class ResearchAdmin(admin.ModelAdmin):
	search_fields = ('app_id',)

class OtherAdmin(admin.ModelAdmin):
	search_fields = ('app_id',)

class Annexure_OBCAdmin(admin.ModelAdmin):
	search_fields = ('app_id',)

class Annexure_Part_TimeAdmin(admin.ModelAdmin):
	search_fields = ('app_id',)

class DocumentAdmin(admin.ModelAdmin):
	search_fields = ('app_id',)

class FlagAdmin(admin.ModelAdmin):
	list_display = ('profile_pic', 'annexure_obc', 'annexure_parttime', 'ssc', 'intermediate',
	               'bacheoler_degree', 'bacheoler_memo', 'masters_degree', 'masters_memo', 'caste_certi',
	               'pwd_certi', 'qualifying_scorecard', 'papers', 'guidebio', 'application')
	search_fields = ('app_id',)

# Register your models here.
admin.site.register(Appdata, AppdataAdmin)
admin.site.register(PaymentDetails, PaymentDetailsAdmin)
admin.site.register(GeneralData, GeneralDataAdmin)
admin.site.register(Experience, ExperienceAdmin)
admin.site.register(Education, EducationAdmin)
admin.site.register(QualifyingExam, QualifyingExamAdmin)
admin.site.register(QualifyingExamDetails, QualifyingExamDetailsAdmin)
admin.site.register(Annexure_OBC, Annexure_OBCAdmin)
admin.site.register(Annexure_Part_Time, Annexure_Part_TimeAdmin)
admin.site.register(Research, ResearchAdmin)
admin.site.register(Other, OtherAdmin)
admin.site.register(Document, DocumentAdmin)
admin.site.register(Flag, FlagAdmin)