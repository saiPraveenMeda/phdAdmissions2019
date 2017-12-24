from django.conf.urls import url
import views

urlpatterns = [
    url(r'^$', views.index, name = 'index'),
    # url(r'^createApp/$',views.createApp,name='createApp'),
    # url(r'^signup/(?P<errorNo>[0-9]{1})/$',views.send_to_register,name='send_to_register'),
    # url(r'^signup/$',views.send_to_register,name='send_to_register'),
    url(r'^signin/$',views.signin,name='signin'),
    url(r'^signout/$',views.signout,name='signout'),
    # url(r'^termsandconditions/$',views.termsandconditions,name='termsandconditions'),
    # url(r'^forgotPassword/$',views.forgotPassword,name='forgotPassword'),
    # url(r'^paymentDetails/$',views.paymentDetails,name='paymentDetails'),
]