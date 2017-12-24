from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index, name = 'index'),
    # url(r'^annexures/', views.annexures, name = 'annexures'),
    # url(r'^uploadpic/$',views.uploadpic,name='uploadpic'),
    # url(r'^annexure_obc/', views.annexure_obc, name = 'annexure_obc'),
    # url(r'^annexure_parttime/', views.annexure_parttime, name = 'annexure_parttime'),
    # url(r'^uploadDocs/', views.uploadDocs, name = 'uploadDocs'),
    # url(r'^submit/$',views.submit,name='submit'),
    # url(r'^print_main_application', views.print_main_application, name = 'print_main_application'),
    # url(r'^print_annexures', views.print_annexures, name = 'print_annexures'),
    # url(r'^printAck/$',views.printAck,name='printAck')
]