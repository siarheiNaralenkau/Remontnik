from django.conf.urls import patterns, url, include
from django.conf import settings
from remont import views

skip_last_activity_date = [
    #Your expressions go here
]

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^register/$', views.register, name='register'),
    url(r'^suggest_job/$', views.suggest_job, name='suggest_job'),
    url(r'^(?P<user_id>\d+)/profile/$', views.profile, name='profile'),    
    url(r'^suggest_job_save/$', views.suggest_job_save, name='suggest_job_save'),    
    url(r'^organizations_list/$', views.organizations_list, name='organizations_list'),
    url(r'^org_profile/$', views.org_profile, name='org_profile'),
    url(r'^get_job_types_by_category/$', views.get_job_types_by_category, name='get_job_types_by_category'),
    url(r'^suggest_job_save_ajax/$', views.suggest_job_save_ajax, name='suggest_job_save_ajax'),
    url(r'^search_organizations/$', views.search_organizations, name='search_organizations'),
    url(r'^create_organization/$', views.create_organization, name='create_organization'),
    url(r'^site_login/$', views.site_login, name='site_login'),
    url(r'^site_logout/$', views.site_logout, name='site_logout'),
    url(r'^set_password/$', views.set_password, name='set_password'),
    url(r'^get_album_photos/$', views.get_album_photos, name='get_album_photos'),
    url(r'^orgs_list/$', views.get_orgs_list, name='get_orgs_list'),
    url(r'^view_profile/$', views.view_profile, name='view_profile'),
    url(r'^get_profile_info/$', views.get_profile_info, name='get_profile_info'),
    (r'^ckeditor/', include('ckeditor.urls')),
)

if settings.DEBUG:
    urlpatterns += patterns('',
        url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': settings.MEDIA_ROOT,
        }),
    )
