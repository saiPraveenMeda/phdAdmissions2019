from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.GoToTransaction, name='index'),
    url(r'^success/$', views.TransactionSuccess, name='success'),
    url(r'^failure/$', views.TransactionFailure, name='failure'),
    url(r'^cancellation/$', views.TransactionCancellation, name='success'),
]