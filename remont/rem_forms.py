# -*- coding: utf-8 -*-

from django import forms
from models import WorkType, City
from remont.models import WorkSpec
from remont.rem_widgets import CustomCheckBoxSelectMultiple


def get_cities():
    cities_choices = []
    cities = City.objects.all()
    for city in cities:
        cities_choices.append((city.id, city.name))
    return tuple(cities_choices)


class SuggestJobForm(forms.Form):
    contact_person = forms.CharField(label=u"Контактное лицо", max_length=80)
    short_header = forms.CharField(label=u"Краткий заголовок заявки", max_length=50)
    workType = forms.ModelChoiceField(label=u"Вид работ", queryset=WorkType.objects.all())
    description = forms.CharField(label=u"Описание работы", widget=forms.Textarea(attrs={'cols': 80, 'rows': 5}))
    phone = forms.CharField(label=u"Телефон", max_length=40)
    email = forms.CharField(label=u"Электронная почта", max_length=60)


class RegisterForm(forms.Form):
    def __init__(self, *args, **kwargs):
        super(RegisterForm, self).__init__(*args, **kwargs)
        self.fields['reg_city'] = forms.ChoiceField(choices=get_cities(), label=u"Город регистрации")
        self.fields['work_cities'] = forms.ModelMultipleChoiceField(queryset=City.objects.all(),
                                                                    label=u"Организация работает в следующих городах",
                                                                    widget=forms.CheckboxSelectMultiple)

    name = forms.CharField(max_length=100,
                           label=u'Название организации',
                           widget=forms.TextInput(attrs={}))
    spec = forms.MultipleChoiceField(choices=WorkSpec.WORK_SPEC, widget=forms.CheckboxSelectMultiple,
                                     label=u"Специализация")
    reg_city = forms.ChoiceField(choices=get_cities(), label=u"Город регистрации")
    reg_address = forms.CharField(max_length=150, label=u"Адрес организации", required=False)

    job_types = forms.ModelMultipleChoiceField(queryset=WorkType.objects.all(),
                                               label=u"Виды выполняемых работ",
                                               widget=CustomCheckBoxSelectMultiple)

    logo = forms.ImageField(label=u"Логотип", required=False)
    description = forms.CharField(label=u"Обшая информация об организации",
                                  required=False,
                                  widget=forms.Textarea(attrs={"rows": 5, "cols": 80}))
    landing_phone = forms.CharField(label=u"Стационарный телефон", max_length=30, required=False)
    mobile_phone = forms.CharField(label=u"Мобильный телефон", max_length=30, required=False)
    mobile_phone2 = forms.CharField(label=u"Второй мобильный телефон", max_length=30, required=False)
    fax = forms.CharField(label=u"Номер факса", max_length=40, required=False)
    web_site = forms.URLField(label=u"Домашняя страница", max_length=100, required=False)
    email = forms.EmailField(label=u"Электронная почта", max_length=100, required=False)
    work_cities = forms.ModelMultipleChoiceField(queryset=City.objects.all(),
                                                 label=u"Организация работает в городах",
                                                 widget=forms.CheckboxSelectMultiple)

