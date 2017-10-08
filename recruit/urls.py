from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index, name = 'index'),
    url(r'^annexures/(?P<name>[a-z_]+)/', views.annexures, name = 'annexures'),
    url(r'^printSummary/$',views.printSummary,name='printSummary'),
    url(r'^print_main_application', views.print_main_application, name = 'print_main_application'),
    url(r'^print_annexures', views.print_annexures, name = 'print_annexures'),
    url(r'^uploadPaper/(?P<papernum>[0-9]{1})/$',views.uploadPaper),
    url(r'^lockApplication/$',views.lockApplication,name='lockApplication'),
    url(r'^printAck/$',views.printAck,name='printAck'),
    url(r'^refresh/(?P<annexName>[a-z0-9_]+)/$',views.refresh),
    url(r'^uploadExpDoc/$',views.uploadExpDoc),
    url(r'^all_annexures/$',views.all_annexures),
]
