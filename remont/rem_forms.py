# -*- coding: utf-8 -*-

from django import forms
from models import WorkType


class SuggestJobForm(forms.Form):
    contact_person = forms.CharField(label=u"Контактное лицо", max_length=80)
    short_header = forms.CharField(label=u"Краткий заголовок заявки", max_length=50)
    workType = forms.ModelChoiceField(label=u"Вид работ", queryset=WorkType.objects.all())
    description = forms.CharField(label=u"Описание работы", widget=forms.Textarea(attrs={'cols': 80, 'rows': 5}))
    phone = forms.CharField(label=u"Телефон", max_length=40)
    email = forms.CharField(label=u"Электронная почта", max_length=60)

