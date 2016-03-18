from django.conf.urls import patterns, url, include
from django.conf import settings
from remont import views

skip_last_activity_date = [
    #Your expressions go here
    ]

urlpatterns = patterns('',
  url(r'^$', views.index, name='index'),
  url(r'^register/$', views.register, name='register'),
  url(r'^suggest_job_save/$', views.suggest_job_save, name='suggest_job_save'),
  url(r'^suggest_job_save_ajax/$', views.suggest_job_save_ajax, name='suggest_job_save_ajax'),
  url(r'^search_organizations/$', views.search_organizations, name='search_organizations'),
  url(r'^create_organization/$', views.create_organization, name='create_organization'),
  url(r'^site_login/$', views.site_login, name='site_login'),
  url(r'^site_logout/$', views.site_logout, name='site_logout'),
  url(r'^get_album_photos/$', views.get_album_photos, name='get_album_photos'),
  url(r'^view_profile/$', views.view_profile, name='view_profile'),
  url(r'^get_profile_info/$', views.get_profile_info, name='get_profile_info'),
  url(r'^send_text_mesaage/$', views.send_text_mesaage, name='send_text_mesaage'),
  url(r'^confirm_registration/$', views.confirm_registration, name='confirm_registration'),
  url(r'^upload_work_photos/$', views.upload_work_photos, name='upload_work_photos'),
  url(r'^create_photo_album/$', views.create_photo_album, name='create_photo_album'),
  url(r'^edit_album/$', views.edit_album, name='edit_album'),
  url(r'^delete_photo/$', views.delete_photo, name='delete_photo'),
  url(r'^edit_organization/(?P<id>\d+)/$', views.edit_organization, name='edit_organization'),
  url(r'^orgs_list/$', views.orgs_list, name='orgs_list'),
  url(r'^change_password/$', views.change_password, name='change_password'),
  url(r'^jobs_list/$', views.jobs_list, name='jobs_list'),
  url(r'^get_orgs_by_job_type/$', views.get_orgs_by_job_type, name='get_orgs_by_job_type'),
  url(r'^add_partner_request/$', views.add_partner_request, name='add_partner_request'),
  url(r'^approve_partner/$', views.approve_partner, name='approve_partner'),
  url(r'^reject_partner/$', views.reject_partner, name='reject_partner'),
  url(r'^change_spec_filter/$', views.change_spec_filter, name='change_spec_filter'),
  url(r'^get_new_messages_for_user/$', views.get_new_messages_for_user, name='get_new_messages_for_user'),
  url(r'^answer_mesaage/$', views.answer_mesaage, name='answer_mesaage'),
  url(r'^get_dialogs_history/$', views.get_dialogs_history, name='get_dialogs_history'),
  url(r'^check_spec/$', views.check_spec, name='check_spec'),
  url(r'^articles_list/$', views.articles_list, name='articles_list'),
  url(r'^read_article/(?P<id>\d+)/$', views.read_article, name='read_article'),
  url(r'^redactor/', include('redactor.urls')),
)

if settings.DEBUG:
  urlpatterns += patterns('',
    url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {
      'document_root': settings.MEDIA_ROOT,
      }),
  )
