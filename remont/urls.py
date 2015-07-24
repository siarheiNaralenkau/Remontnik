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
    url(r'^suggest_job_save/$', views.suggest_job_save, name='suggest_job_save'),    
    url(r'^organizations_list/$', views.organizations_list, name='organizations_list'),    
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
    url(r'^send_text_mesaage/$', views.send_text_mesaage, name='send_text_mesaage'),
    url(r'^confirm_registration/$', views.confirm_registration, name='confirm_registration'),    
    url(r'^upload_work_photos/$', views.upload_work_photos, name='upload_work_photos'),
    url(r'^create_photo_album/$', views.create_photo_album, name='create_photo_album'),
    url(r'^edit_album/$', views.edit_album, name='edit_album'),
    url(r'^delete_photo/$', views.delete_photo, name='delete_photo'),
    url(r'^edit_organization/(?P<id>\d+)/$', views.edit_organization, name='edit_organization'),
    (r'^ckeditor/', include('ckeditor.urls')),
)

if settings.DEBUG:
    urlpatterns += patterns('',
        url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': settings.MEDIA_ROOT,
        }),
    )
