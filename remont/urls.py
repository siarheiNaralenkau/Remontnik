from django.conf.urls import patterns, url
from django.conf import settings
from remont import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^register/$', views.register, name='register'),
    url(r'^suggest_job/$', views.suggest_job, name='suggest_job'),
    url(r'^(?P<user_id>\d+)/profile/$', views.profile, name='profile'),
    url(r'^create_user/$', views.create_user, name='create_user'),
    url(r'^suggest_job_save/$', views.suggest_job_save, name='suggest_job_save'),
    url(r'^user_profile/$', views.user_profile, name='user_profile'),
    url(r'^update_user_profile/$', views.update_user_profile, name='update_user_profile'),
    url(r'^organizations_list/$', views.organizations_list, name='organizations_list'),
    url(r'^org_profile/$', views.org_profile, name='org_profile'),
    url(r'^get_job_types_by_category/$', views.get_job_types_by_category, name='get_job_types_by_category'),
    url(r'^suggest_job_save_ajax/$', views.suggest_job_save_ajax, name='suggest_job_save_ajax'),
    url(r'^search_organizations/$', views.search_organizations, name='search_organizations'),
    url(r'^create_organization/$', views.create_organization, name='create_organization'),
    url(r'^login/$', views.login, name='login'),
)

if settings.DEBUG:
    urlpatterns += patterns('',
        url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': settings.MEDIA_ROOT,
        }),
    )
