# -*- coding: utf-8 -*-

from django import forms
from remont.models import WorkSpec, OrganizationProfile, WorkType, City, WorkPhoto
from remont.rem_widgets import CustomCheckBoxSelectMultiple, SingleImageInput

from django.forms import Textarea, Select, PasswordInput, CheckboxSelectMultiple, HiddenInput

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

  name = forms.CharField(max_length=100,
   label=u'Название организации',
   widget=forms.TextInput(attrs={}),
   error_messages={"required": u"Укажите название организации"})

  logo = forms.ImageField(label="Логотип организации", widget=SingleImageInput(), required=False)
  city = forms.ModelChoiceField(queryset=City.objects.order_by("name"), label=u"Город регистрации", required=False)
  address = forms.CharField(label="Адрес", max_length=180, required=False, widget=Textarea(attrs={'cols': 60, 'rows': 3}))
  description = forms.CharField(label=u"Обшая информация об организации", required=False, widget=forms.Textarea(attrs={"rows": 8, "cols": 60}))

  landing_phone = forms.CharField(label=u"Стационарный телефон", max_length=30, required=False)
  mobile_phone = forms.CharField(label=u"Мобильный телефон", max_length=30, required=False)
  mobile_phone2 = forms.CharField(label=u"Второй мобильный телефон", max_length=30, required=False)
  fax = forms.CharField(label=u"Номер факса", max_length=40, required=False)
  web_site = forms.URLField(label=u"Домашняя страница", max_length=100, required=False)
  email = forms.EmailField(label=u"Электронная почта", max_length=100, required=True, error_messages={"required": u"Укажите электронную почту"})

  login = forms.CharField(label=u"Логин на сайте",
    max_length=100,
    required=True,
    error_messages={"required": u"Укажите логин аккаунта организации"})
  password = forms.CharField(label="Пароль",
   max_length=16,
   required=True,
   widget=PasswordInput(),
   error_messages={"required": u"Укажите пароль аккаунта организации"})
  password_repeat = forms.CharField(label="Повторите пароль",
    max_length=16,
    required=True,
    widget=PasswordInput(),
    error_messages={"required": u"Введите пароль повторно"})

  work_cities = forms.ModelMultipleChoiceField(label="Города, где работаете",
   required=True,
   queryset=City.objects.order_by("name"),
   widget=CheckboxSelectMultiple(),
   error_messages={"required": u"Укажите города, в которых работаете"})
  job_types = forms.ModelMultipleChoiceField(label="Виды выполняемых работ",
   required=True,
   queryset=WorkType.objects.all(),
   widget=CustomCheckBoxSelectMultiple(),
   error_messages={"required": u"Укажите виды выполняемых работ"})


class OrganizationProfileModelForm(forms.ModelForm):
  class Meta:
    model = OrganizationProfile
    fields = ('name', 'logo', 'city', 'address', 'spec',
      'description',  'login', 'password', 'landline_phone', 'mobile_phone',
      'mobile_phone2', 'fax', 'web_site', 'email', 'work_cities', 'job_types', 'collegues', 'login', 'password', )
    widgets = {
      'job_types': CustomCheckBoxSelectMultiple,
      'address': Textarea(attrs={'cols': 60, 'rows': 3}),
      'city': Select(attrs={'style': 'width: 200px; float: none'}),
      'description': Textarea(attrs={'cols': 100, 'rows': 10, 'style': 'overflow: auto; margin-left: 20px'}),
      'logo': SingleImageInput,
      'collegues': CheckboxSelectMultiple
    }


class OrganizationEditForm(forms.ModelForm):
  def __init__(self, *args, **kwargs):
    super(OrganizationEditForm, self).__init__(*args, **kwargs)
    instance = getattr(self, 'instance', None)
    if instance and instance.pk:
      self.fields['name'].widget.attrs['readonly'] = True

  class Meta:
    model = OrganizationProfile
    fields = ('name', 'logo', 'city', 'address', 'description',  'landline_phone', 'mobile_phone',
      'mobile_phone2', 'fax', 'web_site', 'email', 'login', 'work_cities', 'job_types')
    labels = {'web_site': u'Домашняя страница', 'email': u'Электронная почта', 'work_cities': u'Города, где работаете'}
    error_messages = {
      'name': {
        'required': u"Укажите название организации"
      },
      'email': {
        'required': u'Укажите электронную почту'
      },
      'login': {
        'required': u'Укажите логин аккаунта организации'
      },
      'work_cities': {
        'required': u'Укажите города, в которых работаете'
      },
      'job_types': {
        'required': u'Укажите виды выполняемых работ'
      }
    }
    widgets = {
      'job_types': CustomCheckBoxSelectMultiple(),
      'address': Textarea(attrs={'cols': 60, 'rows': 3}),
      'city': Select(attrs={'style': 'width: 200px; float: none'}),
      'description': Textarea(attrs={'cols': 60, 'rows': 8}),
      'logo': SingleImageInput(),
      'collegues': CheckboxSelectMultiple(),
      'work_cities': CheckboxSelectMultiple()
    }


class UploadPhotoForm(forms.ModelForm):
  class Meta:
    model = WorkPhoto
    fields = ('organization', 'album', 'photo')
