from django.contrib import admin
from remont.models import WorkCategory, WorkType, UserProfile, City, OrganizationProfile


class WorkTypeAdmin(admin.ModelAdmin):
    list_display = ('name', 'category')
    search_fields = ('name',)
    list_filter = ('category',)

admin.site.register(WorkCategory)
admin.site.register(WorkType, WorkTypeAdmin)
admin.site.register(UserProfile)
admin.site.register(City)
admin.site.register(OrganizationProfile)

