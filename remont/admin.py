from django.contrib import admin
from django import forms
from remont.models import WorkCategory, WorkType, City, OrganizationProfile, JobSuggestion, WorkSpec, \
WorkPhotoAlbum, WorkPhoto, Article
from remont.rem_forms import OrganizationProfileModelForm

from django.utils.encoding import force_unicode
from django.utils.html import conditional_escape, format_html
from django.utils.safestring import mark_safe

from django.forms import Textarea, Select


# Custom admin classes
class WorkTypeAdmin(admin.ModelAdmin):
  list_display = ('name', 'category')
  search_fields = ('name',)
  list_filter = ('category',)


class OrganizationProfileAdmin(admin.ModelAdmin):
  list_display = ('name', 'get_spec', 'city', 'address')
  list_filter = ('city', 'job_types__category', 'spec', 'job_types', 'work_cities')
  search_fields = ['name']
  form = OrganizationProfileModelForm
  exclude = ('collegues',)


class ArticleAdmin(admin.ModelAdmin):
  list_display = ('name', 'date_created', 'date_modified')


admin.site.register(WorkCategory)
admin.site.register(WorkType, WorkTypeAdmin)
admin.site.register(City)
admin.site.register(OrganizationProfile, OrganizationProfileAdmin)
admin.site.register(JobSuggestion)
admin.site.register(WorkSpec)
admin.site.register(WorkPhotoAlbum)
admin.site.register(WorkPhoto)
admin.site.register(Article, ArticleAdmin)
