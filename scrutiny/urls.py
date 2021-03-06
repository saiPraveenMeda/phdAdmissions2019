from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index, name = 'index'),
    url(r'^verifyApplication/(?P<applnid>[0-9PH]+)$', views.verifyApplication, name = 'verifyApplication'),
    url(r'^viewApplication/(?P<applnid>[0-9PH]+)$', views.viewApplication, name = 'viewApplication'),
    url(r'^shortlistApplication/(?P<applnid>[0-9PH]+)$', views.shortlistApplication, name = 'shortlistApplication'),
    url(r'^unshortlistApplication/(?P<applnid>[0-9PH]+)$', views.unshortlistApplication, name = 'unshortlistApplication'),
    url(r'^generateReport$', views.generateReport, name = 'generateReport'),
]