# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http import HttpResponse, Http404

from payu.gateway import payu_url
from hashlib import sha512
# from payu import get_hash, check_hash
from uuid import uuid4
import requests
from django.conf import settings
from .models import *

# Create your views here.

def _get_hash(key, txnid, amount, productinfo, firstname, email):
	return get_hash({'key':key, 'txnid':txnid, 'amount':amount, 'productinfo':productinfo, 'firstname':firstname, 'email':email})

def index(request):
	return HttpResponse('Hi')


def GoToTransaction(request):
	response = {}
	response['categories'] = Category.objects.all()
	if request.method != 'POST':
		return render(request, 'payment/home.djt', response)

	response['key'] = settings.PAYU_INFO['PAYU_MERCHANT_KEY']
	response['txnid'] = uuid4.hex()
	response['amount'] = request.POST['amount']
	response['productinfo'] = request.POST['category']
	response['firstname'] = request.POST['firstname']
	response['email'] = request.POST['email']
	response['phone'] = request.POST['phone']
	response['surl'] = 'https://admissions.nitw.ac.in/payment/success'
	response['furl'] = 'https://admissions.nitw.ac.in/payment/failure'
	response['curl'] = 'https://admissions.nitw.ac.in/payment/cancellation'
	response['hash'] = _get_hash(response['key'], response['txnid'], response['amount'],
		                         response['productinfo'], response['firstname'], response['email'])
	response['url'] = payu_url()
	return render(request, 'payment/confirmation.djt', response)

def TransactionSuccess(request):
	return HttpResponse('Transaction Success')

def TransactionFailure(request):
	return HttpResponse('Transaction Failure')

def TransactionCancellation(request):
	return HttpResponse('Transaction Cancelled')