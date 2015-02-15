from django.contrib import admin
from remont.models import WorkCategory, WorkType, UserProfile, City, OrganizationProfile


admin.site.register(WorkCategory)
admin.site.register(WorkType)
admin.site.register(UserProfile)
admin.site.register(City)
admin.site.register(OrganizationProfile)

