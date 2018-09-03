"""facultyForm URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include 
from django.contrib import admin
from django.conf.urls.static import static
from django.conf import settings
from django.views.generic.base import RedirectView
from django.http import HttpResponse

favicon_view = RedirectView.as_view(url='/static/img/favicon.png', permanent=True)

urlpatterns = [
    url(r'^robots\.txt$', lambda r: HttpResponse('User-agent: *\nDisallow: /', content_type='text/plain')),
    url(r'^favicon\.ico$', favicon_view),
    url(r'^secureadmin/', admin.site.urls),
    url(r'^', include('recruit.urls', namespace='recruit')),
    url(r'^register/', include('registration.urls', namespace='register')),
    url(r'^scrutiny/', include('scrutiny.urls', namespace='scrutiny')),
    url(r'^payment/', include('payment.urls', namespace='payment')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

