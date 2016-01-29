from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
  url(r'^', include('remont.urls')),
  url(r'^remont/', include('remont.urls')),
  url(r'^admin/', include(admin.site.urls)),
)
