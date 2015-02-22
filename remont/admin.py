from django.contrib import admin
from django import forms
from remont.models import WorkCategory, WorkType, UserProfile, City, OrganizationProfile, JobSuggestion

from django.utils.encoding import force_unicode
from django.utils.html import conditional_escape, format_html
from django.utils.safestring import mark_safe


# Custom widgets
class CustomCheckBoxSelectMultiple(forms.CheckboxSelectMultiple):

    items_pre_row = 1

    def render(self, name, value, attrs=None, choices=()):
        # Get job types grouped by categories.
        id_ = attrs.get(u'id', None)
        start_tag = format_html(u'<ul id="{0}">', id_) if id_ else '<ul>'

        types_by_category = {}
        categories = WorkCategory.objects.all()
        for category in categories:
            types_by_category[category.name] = []


        output = [u"""
            <script type="text/javascript">
                function expand(categoryItem) {
                    var typesList = categoryItem.childNodes[5];
                    var isVisible = typesList.style.display;
                    if(isVisible == 'none') {
                        categoryItem.childNodes[1].innerHTML = '-';
                        typesList.style.display = 'block';
                    }
                    else {
                        categoryItem.childNodes[1].innerHTML = '+';
                        typesList.style.display = 'none';
                    }
                }

                function stopProcessing(event) {
                    event.stopPropagation();
                }
            </script>
            <style>
                .expand-state {
                    margin-right: 10px;
                    font-size: 16px;
                    border: 1px solid black;
                    padding-left: 5px;
                    padding-right: 5px;
                }
                .category-label {
                    padding: 6px 6px 6px 6px;
                    background-color: #c5c5c5;
                    border-radius: 10px;
                    box-shadow: 0 0 7px rgba(0,0,0,0.6);
                }
                .job-item-first {
                    margin-top: 7px
                }
                ul {
                    list-style-type: none;
                }
            </style>
        """]

        output.append(start_tag)
        for i, choice in enumerate(self.choices):
            choice_value, choice_label = choice
            work_type = WorkType.objects.get(pk=choice_value)
            types_by_category[work_type.category.name].append(work_type)

        print types_by_category

        # Forming the output.
        for category in types_by_category:
            types = types_by_category[category]
            output.append(format_html(u'<li onclick="expand(this)" style="margin-bottom: 10px">'))
            output.append(format_html(u'<span class="expand-state">+</span>'))
            output.append(format_html(u'<span class="category-label">{0}</span>'.format(category)))
            output.append(format_html(u'<ul class="expandable" style="display: none">'))
            for job_type in types:
                output.append(format_html(u'<li onclick="stopProcessing(event)" class="job-item-first">'))
                output.append(format_html(u'<label for="{0}_{1}">'.format(id_, job_type.id)))
                output.append(format_html(u'<input id="{0}_{1}" name="{2}" type="checkbox" value={3}'.
                                          format(id_, job_type.id, name, job_type.id)))
                if value and job_type.id in value:
                    output.append(format_html(u' checked="checked"'))
                output.append(format_html(u'/>{0}</label></li>'.format(job_type.name)))
            output.append(format_html(u'</ul></li>'))

        output.append(u'</ul>')

        return mark_safe('\n'.join(output))

        # Selected job types are stored in "value" list.
        # To Override output rendering - see example at: http://stackoverflow.com/questions/3986757/how-can-i-render-a-custom-nested-checkbox-tree-view-in-django-admin
        # return super(CustomCheckBoxSelectMultiple, self).render(name, value, attrs, choices)
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
admin.site.register(JobSuggestion)

