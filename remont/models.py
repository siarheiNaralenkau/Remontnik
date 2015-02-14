# -*- coding: utf-8 -*-

from django.db import models
from django.contrib.auth.models import User
from django.utils.encoding import python_2_unicode_compatible


def save_user_photo(instance, filename):
    storage_path = "/".join(instance.user.username, filename)
    print storage_path
    return storage_path


def save_media_file(instance, filename):
    storage_path = "/".join([instance.user.username, instance.file_type, filename])
    print storage_path
    return storage_path


def save_job_icon(instance, filename):
    storage_path = "icons/" + filename
    return storage_path


class WorkCategory(models.Model):
    name = models.CharField(u"Наименование категории работ", max_length=100)
    icon = models.ImageField(upload_to=save_job_icon, null=True)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u'Категория работ'
        verbose_name_plural = u'Категории работ'


class WorkType(models.Model):
    name = models.CharField(u"Вид работы", max_length=100)
    category = models.ForeignKey(WorkCategory, verbose_name=u"Категория работ")
    icon = models.ImageField(upload_to=save_job_icon, null=True)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u'Вид работы'
        verbose_name_plural = u'Виды работ'


class UserProfile(models.Model):
    REG_TYPE_CHOICES = (
        ('client', u'Заказчик'),
        ('master', u'Исполнитель'),
        ('seller', u'Продавец'),
    )

    class Meta:
        verbose_name = u"Зарегистрированный пользователь"
        verbose_name_plural = u"Зарегистрированные пользователи"

    user = models.OneToOneField(User)
    reg_type = models.CharField(u"Вид регистрации", choices=REG_TYPE_CHOICES, default='client', max_length=20)
    phone = models.CharField(u"Контактный телефон", max_length=25, blank=True, default="")
    contact_name = models.CharField(u"Контактное имя", max_length=60, blank=True, default="")
    profile_image = models.ImageField(u"Логотип или фото", upload_to=save_user_photo, null=True)

@python_2_unicode_compatible
class JobSuggestion(models.Model):
    class Meta:
        verbose_name = u"Предложение по работе"
        verbose_name_plural = u"Предложения по работе"
    short_header = models.CharField(u"Краткий заголовок заявки", max_length=50, default="",
                                    help_text=u"Краткий заголовок заявки")
    contact_name = models.CharField(u"Контактное лицо", max_length=100, default="")
    job_type = models.ForeignKey(WorkType, verbose_name=u"Вид работ", null=True, default="")
    description = models.TextField(u"Описание работы", default="")
    phone = models.CharField(u"Контактный телефон", max_length=25, default="")
    email = models.EmailField(u"Электронная почта", default="")
    date_created = models.DateTimeField(verbose_name=u"Дата создания", auto_now_add=True)

    def __unicode__(self):
        return "Job info: {0}, {1}, {2}, {3}, {4}".format(self.contact_name, self.job_type, self.description,
                                                          self.phone, self.email)

    def __str__(self):
        return "Job info: {0}, {1}, {2}, {3}, {4}".format(self.contact_name, self.job_type, self.description,
                                                          self.phone, self.email)


class UserMedia(models.Model):
    FILE_TYPE_CHOICES = (
        ('video', u'Video'),
        ('image', u'Image'),
    )

    class Meta:
        verbose_name = u"Фото или видео работы мастера"
        verbose_name_plural = u"Фото и видео примеры работы мастера"

    work_file = models.FileField(upload_to=save_media_file)
    file_type = models.CharField(u"Тип записи работы", max_length=10, choices=FILE_TYPE_CHOICES, default="image")
    account = models.ForeignKey(UserProfile, verbose_name=u"Пользователь", null=True)


