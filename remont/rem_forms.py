# -*- coding: utf-8 -*-

from django import forms
from django.forms import Textarea, Select, PasswordInput, CheckboxSelectMultiple, HiddenInput, TextInput
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError

from remont.models import WorkSpec, OrganizationProfile, WorkType, City, WorkPhoto, Product, Article
from remont.rem_widgets import CustomCheckBoxSelectMultiple, SingleImageInput

from redactor.widgets import RedactorEditor

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

  def clean_login(self):
    login = self.cleaned_data["login"]
    same_name_orgs = User.objects.filter(username=login)
    if len(same_name_orgs):
      raise ValidationError( u"Логин \"{0}\" уже используется!".format(login), code="duplicate")
    return login

  def clean_name(self):
    org_name = self.cleaned_data["name"]
    same_name_orgs = OrganizationProfile.objects.filter(name=org_name)
    if len(same_name_orgs):
      raise ValidationError( u"Организация с названием \"{0}\" уже зарегистрирована!".format(org_name), code="duplicate")
    return org_name

  def clean(self):
    cleaned_data = super(RegisterForm, self).clean()
    if not cleaned_data.get("landline_phone") and not cleaned_data.get("mobile_phone") and not cleaned_data.get("mobile_phone2") and not cleaned_data.get("fax"):
      raise ValidationError(u"Заполните хотя бы одно из полей: " + ", ".join([
          OrganizationProfile._meta.get_field_by_name('landline_phone')[0].verbose_name,
          OrganizationProfile._meta.get_field_by_name('mobile_phone')[0].verbose_name,
          OrganizationProfile._meta.get_field_by_name('mobile_phone2')[0].verbose_name,
          OrganizationProfile._meta.get_field_by_name('fax')[0].verbose_name,
      ]))
    return self.cleaned_data

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
    fields = ('name', 'logo', 'city', 'address', 'spec', 'is_job_executor', 'is_seller',
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


class ProductModelForm(forms.ModelForm):
  class Meta:
    model = Product
    fields = ('name', 'description', 'ptype', 'image')
    widgets = {
      'name': TextInput(attrs={'size': 120}),
      'description': Textarea(attrs={'cols': 120, 'rows': 3})
    }


class OrganizationEditForm(forms.ModelForm):
  def __init__(self, *args, **kwargs):
    super(OrganizationEditForm, self).__init__(*args, **kwargs)
    instance = getattr(self, 'instance', None)
    if instance and instance.pk:
      self.fields['name'].widget.attrs['readonly'] = True
      self.fields['city'].widget.attrs['disabled'] = True
      self.fields['address'].widget.attrs['readonly'] = True
      self.fields['description'].widget.attrs['readonly'] = True
      self.fields['landline_phone'].widget.attrs['readonly'] = True
      self.fields['mobile_phone'].widget.attrs['readonly'] = True
      self.fields['mobile_phone2'].widget.attrs['readonly'] = True
      self.fields['fax'].widget.attrs['readonly'] = True
      self.fields['web_site'].widget.attrs['readonly'] = True
      self.fields['email'].widget.attrs['readonly'] = True
      self.fields['login'].widget.attrs['readonly'] = True
      self.fields['work_cities'].widget.attrs['disabled'] = True

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
      'address': Textarea(attrs={'class': 'profile-textarea address-textarea'}),
      'city': Select(attrs={'style': 'width: 200px; float: none'}),
      'description': Textarea(attrs={'class': 'profile-textarea description-textarea'}),
      'logo': SingleImageInput(),
      'work_cities': CheckboxSelectMultiple()
    }


class UploadPhotoForm(forms.ModelForm):
  class Meta:
    model = WorkPhoto
    fields = ('organization', 'album', 'photo')


class ArticleAdminForm(forms.ModelForm):
  class Meta:
    model = Article
    fields = ('name', 'content', 'job_spec')

