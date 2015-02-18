from django.contrib import admin
from django import forms
from remont.models import WorkCategory, WorkType, UserProfile, City, OrganizationProfile

from django.utils.encoding import force_unicode
from django.utils.html import conditional_escape, format_html
from django.utils.safestring import mark_safe


# Custom widgets
class CustomCheckBoxSelectMultiple(forms.CheckboxSelectMultiple):

    items_pre_row = 1

    def render(self, name, value, attrs=None, choices=()):
        # Get job types grouped by categories.
        id_ = self.attrs.get('id', None)
        start_tag = format_html('<ul id="{0}">', id_) if id_ else '<ul>'

        types_by_category = {}
        categories = WorkCategory.objects.all()
        for category in categories:
            types_by_category[category.name] = []

        output = [start_tag]
        for i, choice in enumerate(self.choices):
            choice_value, choice_label = choice
            work_type = WorkType.objects.get(pk=choice_value)
            types_by_category[work_type.category.name].append(work_type)
        print "Types by category: ", types_by_category
        # Selected job types are stored in "value" list.
        # To Override output rendering - see example at: http://stackoverflow.com/questions/3986757/how-can-i-render-a-custom-nested-checkbox-tree-view-in-django-admin
        return super(CustomCheckBoxSelectMultiple, self).render(name, value, attrs, choices)
        # return mark_safe(output.replace(u'<ul>', u'').replace(u'</ul>', u'').replace(u'<li>', u'<p>').replace(u'</li>', u'</p>'))


# Custom admin forms
class OrganizationProfileModelForm(forms.ModelForm):
    class Meta:
        model = OrganizationProfile
        widgets = {
            # 'job_types': forms.CheckboxSelectMultiple
            'job_types': CustomCheckBoxSelectMultiple
        }


# Custom admin classes
class WorkTypeAdmin(admin.ModelAdmin):
    list_display = ('name', 'category')
    search_fields = ('name',)
    list_filter = ('category',)


class OrganizationProfileAdmin(admin.ModelAdmin):
    list_display = ('name', 'type', 'city', 'address')
    list_filter = ('city', 'job_types__category', 'type', 'job_types', 'work_cities')
    form = OrganizationProfileModelForm

admin.site.register(WorkCategory)
admin.site.register(WorkType, WorkTypeAdmin)
admin.site.register(UserProfile)
admin.site.register(City)
admin.site.register(OrganizationProfile, OrganizationProfileAdmin)

