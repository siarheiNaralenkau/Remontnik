from django.contrib import admin
from django import forms
from remont.models import WorkCategory, WorkType, City, OrganizationProfile, JobSuggestion, WorkSpec, \
WorkPhotoAlbum, WorkPhoto, Article, Currency, JobPrice, ProductCategory, ProductType, Product, SellingProduct
from remont.rem_forms import OrganizationProfileModelForm, ProductModelForm, ArticleAdminForm

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
  form = ArticleAdminForm


class ProductTypeAdmin(admin.ModelAdmin):
  list_display = ('name', 'category')
  list_filter = ('category', )
  search_fields = ['name', 'category']


class ProductAdmin(admin.ModelAdmin):
  list_display = ('name', 'description', 'ptype', 'image')
  list_filter = ('name', 'description')
  search_fields = ['name', 'description']
  form = ProductModelForm


admin.site.register(WorkCategory)
admin.site.register(WorkType, WorkTypeAdmin)
admin.site.register(City)
admin.site.register(OrganizationProfile, OrganizationProfileAdmin)
admin.site.register(JobSuggestion)
admin.site.register(WorkSpec)
admin.site.register(WorkPhotoAlbum)
admin.site.register(WorkPhoto)
admin.site.register(Article, ArticleAdmin)
admin.site.register(Currency)
admin.site.register(JobPrice)
admin.site.register(ProductCategory)
admin.site.register(ProductType, ProductTypeAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(SellingProduct)
