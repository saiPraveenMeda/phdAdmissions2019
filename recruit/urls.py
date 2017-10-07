from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index, name = 'index'),
    # url(r'^academic/annexure_a', views.annexure_a, name = 'annexure_a'),
    # url(r'^academic/annexure_b', views.annexure_b, name = 'annexure_b'),
    # url(r'^academic/annexure_c', views.annexure_c, name = 'annexure_c'),
    # url(r'^academic/annexure_d', views.annexure_d, name = 'annexure_d'),
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
