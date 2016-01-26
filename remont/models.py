# -*- encoding: utf-8 -*-

from django.db import models
from django.contrib.auth.models import User
from django.utils.encoding import python_2_unicode_compatible
from django.core.exceptions import ValidationError
from django.conf import settings
from ckeditor.fields import RichTextField
from redactor.fields import RedactorField
from django.core.validators import MaxValueValidator, MinValueValidator

import os
import os.path
import string
import random


def save_user_photo(instance, filename):
  storage_path = "/".join(instance.user.username, filename)
  return storage_path


def save_media_file(instance, filename):
  storage_path = "/".join([instance.user.username, instance.file_type, filename])
  return storage_path


# Сохранение фотографии работы
def save_work_photo(instance, filename):
  storage_path = str(instance.organization.id)
  if instance.album:
    storage_path = storage_path + "/" + str(instance.album.id)

  # Generate Filename.
  chars = string.ascii_uppercase + string.digits
  f_name = "".join(random.choice(chars) for _ in range(12))
  ext = os.path.splitext(filename)[1][1:].strip().lower()
  f_name = f_name + "." + ext

  storage_path = storage_path + "/" + f_name
  return storage_path


def save_work_video(instance, filename):
  storage_path = str(instance.organization.id) + "/video/" + filename
  return storage_path


def save_job_icon(instance, filename):
  storage_path = "icons/" + filename
  return storage_path


def save_organization_logo(instance, filename):
  storage_path = 'logos/' + filename
  return storage_path


def save_product_image(instance, filename):
  storage_path = 'products/' + filename
  return storage_path


# Категория работ
class WorkCategory(models.Model):
  name = models.CharField(u"Наименование категории работ", max_length=100)
  icon = models.ImageField(upload_to="icons/", blank=True, default=None)

  def __unicode__(self):
    return self.name

  class Meta:
    verbose_name = u'Категория работ'
    verbose_name_plural = u'Категории работ'


# Вид выполняемых работ
class WorkType(models.Model):
  name = models.CharField(u"Вид работы", max_length=100)
  category = models.ForeignKey(WorkCategory, verbose_name=u"Категория работ")

  def __unicode__(self):
    return self.name

  class Meta:
    verbose_name = u'Вид работы'
    verbose_name_plural = u'Виды работ'


# Город
class City(models.Model):
  name = models.CharField(u'Город', max_length=40)

  def __unicode__(self):
    return self.name

  class Meta:
    verbose_name = u'Город'
    verbose_name_plural = u'Города'


# Специализация работ
class WorkSpec(models.Model):

  WORK_SPEC = (
    (u'industrial', u'Промышленное строительство'),
    (u'individual', u'Частное строительство'),
    (u'seller', u'Продажа материалов')
  )

  class Meta:
    verbose_name = u"Специализация"
    verbose_name_plural = u"Специализации работ"

  def __unicode__(self):
    return self.get_name_display()

  name = models.CharField(u"Специализация", max_length=50, choices=WORK_SPEC)


# Аккаунт строительной организации
class OrganizationProfile(models.Model):

  class Meta:
    verbose_name = u'Организация'
    verbose_name_plural = u'Организации'

  name = models.CharField(u'Название организации', max_length=100)
  city = models.ForeignKey(City, verbose_name=u"Город регистрации", related_name="reg_city", null=True)
  address = models.CharField(u'Адрес', max_length=180, blank=True)
  job_types = models.ManyToManyField(WorkType, verbose_name=u"Виды выполняемых работ")
  logo = models.ImageField(u'Логотип организации', upload_to=save_organization_logo, blank=True, default=None)
  spec = models.ManyToManyField(WorkSpec, verbose_name=u"Специализация", default=u'')
  description = models.TextField(u"Обшая информация об организации", blank=True)
  landline_phone = models.CharField(u"Стационарный телефон", max_length=30, blank=True, default='')
  mobile_phone = models.CharField(u"Мобильный телефон", max_length=30, blank=True, default='')
  mobile_phone2 = models.CharField(u"Второй мобильный телефон", max_length=30, blank=True, default='')
  fax = models.CharField(u"Номер факса", max_length=40, blank=True, default='')
  web_site = models.URLField(u"Web-страница",  max_length=100, blank=True)
  email = models.EmailField(u"Контактный e-mail", max_length=100, blank=True)

  work_cities = models.ManyToManyField(City, verbose_name=u"Организация работает в городах")

  password = models.CharField(u'Пароль', max_length=120, blank=True, null=True, default=None)
  login = models.CharField(u'Логин на сайте', max_length=100, blank=True, null=True, default=None)
  account = models.ForeignKey(User, verbose_name=u"Аккаунт", related_name="account", null=True, blank=True)

  collegues = models.ManyToManyField('self', verbose_name=u"Коллеги", related_name="collegues", blank=True)

  is_job_executor = models.BooleanField(u'Производитель работ', default=False)
  is_seller = models.BooleanField(u'Продавец товаров', default=False)

  def save(self, *args, **kwargs):
    if not self.landline_phone and not self.mobile_phone and not self.mobile_phone2 and not self.fax:
      raise ValidationError(u"Заполните хотя бы одно из полей: " + ", ".join([
          OrganizationProfile._meta.get_field_by_name('landline_phone')[0].verbose_name,
          OrganizationProfile._meta.get_field_by_name('mobile_phone')[0].verbose_name,
          OrganizationProfile._meta.get_field_by_name('mobile_phone2')[0].verbose_name,
          OrganizationProfile._meta.get_field_by_name('fax')[0].verbose_name,
      ]))
    else:
      # Создаем аккаунт пользователя для организации, если указан логин
      if self.login and not self.account:
        # TODO Проверяем, сушествует ли пользователь с таким именем.
        same_login_accounts = User.objects.filter(username=self.login)
        if same_login_accounts:
          error_msg = u"Организация с логином " + self.login + u" уже зарегистрирована. Укажите другой логин."
          raise ValidationError(error_msg)
        account = User.objects.create_user(self.login, self.email, self.password)
        account.first_name = self.name
        account.email = self.email
        account.is_active = False
        account.save()
        self.account = account
      super(OrganizationProfile, self).save(*args, **kwargs)


  def clean(self):
    if not self.landline_phone and not self.mobile_phone and not self.mobile_phone2 and not self.fax:
      raise ValidationError(u"Заполните хотя бы одно из полей: " + ", ".join([
        OrganizationProfile._meta.get_field_by_name('landline_phone')[0].verbose_name,
        OrganizationProfile._meta.get_field_by_name('mobile_phone')[0].verbose_name,
        OrganizationProfile._meta.get_field_by_name('mobile_phone2')[0].verbose_name,
        OrganizationProfile._meta.get_field_by_name('fax')[0].verbose_name,
      ]))

  def __unicode__(self):
    return self.name

  def get_spec(self):
    return ', '.join([s.get_name_display() for s in self.spec.all()])
  get_spec.short_description = u'Специализация'


# Предложение работы
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
  job_spec = models.ForeignKey(WorkSpec, verbose_name=u"Специализация", null=True, default="")

  def __unicode__(self):
    return self.short_header


# Фото/Видео ресурсы пользователей
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
  account = models.ForeignKey(User, verbose_name=u"Аккаунт пользователя", null=True)


# Фотоальбомы выполненных работ
class WorkPhotoAlbum(models.Model):
  class Meta:
    verbose_name = u"Фотоальбом организации"
    verbose_name_plural = u"Фотоальбомы организации"

  organization = models.ForeignKey(OrganizationProfile, verbose_name=u"Организация", null=False)
  name = models.CharField(u"Название альбома", max_length=60)

  def save(self, *args, **kwargs):
    super(WorkPhotoAlbum, self).save(*args, **kwargs)
    album_folder = settings.MEDIA_ROOT + str(self.organization.id) + "//" + str(self.id)
    if not os.path.exists(album_folder):
      os.makedirs(album_folder)

  def __unicode__(self):
    return self.name


# Фото выполненных работ
class WorkPhoto(models.Model):
  class Meta:
    verbose_name = u"Фотография выполненной работы"
    verbose_name_plural = u"Фотографии выполненных работ"

  organization = models.ForeignKey(OrganizationProfile, verbose_name=u"Организация", null=True)
  album = models.ForeignKey(WorkPhotoAlbum, verbose_name=u"Альбом", null=True, blank=True)
  photo = models.ImageField(u'Фото сделанной работы', upload_to=save_work_photo)

  def __unicode__(self):
    return self.photo.url


# Видео с примером выполняемых работ
class WorkVideo(models.Model):
  class Meta:
    verbose_name = u"Видео выполненной работы"
    verbose_name_plural = u"Видео выполненных работ"

  organization = models.ForeignKey(OrganizationProfile, verbose_name=u"Организация", null=True)
  video = models.FileField(u"Видео сделанной работы", upload_to=save_work_video)


# Статья о строительстве и ремонте
class Article(models.Model):
  class Meta:
    verbose_name = u"Статья о стройке и ремонте"
    verbose_name_plural = u"Статьи о стройке и ремонте"

  name = models.CharField(u"Название статьи", max_length=100)
  content = RedactorField(max_length=10000, verbose_name=u"Текст статьи")
  job_spec = models.ForeignKey(WorkSpec, verbose_name=u"Специализация", null=True, default="")
  date_created = models.DateTimeField(u"Дата создания статьи", auto_now_add=True, null=True)
  date_modified = models.DateTimeField(u"Дата последнего изменения статьи", auto_now=True, null=True)

  def __unicode__(self):
    return self.name


# Отзыв о работе.
class Review(models.Model):
  class Meta:
    verbose_name = u"Отзыв о работе"
    verbose_name_plural = u"Отзывы о работе"

  mark = models.IntegerField(u"Оценка", null=False, blank=False, validators=[MinValueValidator(0), MaxValueValidator(5)])
  good = models.CharField(u"Плюсы", max_length=200)
  bad = models.CharField(u"Минусы", max_length=200)
  org = models.ForeignKey(OrganizationProfile, verbose_name=u"Организация", null=False, blank=False)


# Сообщение для организации
class Message(models.Model):
  class Meta:
    verbose_name = u"Сообщение"
    verbose_name_plural = u"Сообщения"

  msg_to = models.ForeignKey(User, verbose_name=u"Получатель сообщения", null=False, blank=False, default=None, related_name='receiver')
  msg_from = models.ForeignKey(User, verbose_name=u"Автор сообщения", null=True, blank=True, related_name='sender')
  text = models.CharField(u"Сообщение", max_length=1000)
  was_written = models.DateTimeField(verbose_name=u"Дата создания сообщения", auto_now_add=True, null=True)
  was_read = models.DateTimeField(verbose_name=u"Дата прочтения сообщения", null=True, default=None)


# Валюта
class Currency(models.Model):
  class Meta:
    verbose_name = u"Валюта"
    verbose_name_plural = u"Валюты"

  code = models.CharField(u"Код валюты", max_length=10, null=True, blank=True)
  name = models.CharField(u"Наименование валюты", max_length=50, default=u"бел. руб")


# Цена на определенную работу
class JobPrice(models.Model):
  class Meta:
    verbose_name = u"Стоимость работы"
    verbose_name_plural = u"Стоимости работ"

  org = models.ForeignKey(OrganizationProfile, verbose_name=u"Организация", null=False, blank=False)
  desc = models.CharField(u"Описание работы", max_length=200)
  price = models.IntegerField(u"Цена")
  cur = models.ForeignKey(Currency, verbose_name=u"Валюта", null=True, blank=True)


# Запрос на добавление в партнеры
class PartnerRequest(models.Model):
  class Meta:
    verbose_name = u"Запрос на добавлнение в партнеры"
    verbose_name_plural = u"Запросы на добавление в партнеры"

  date_created = models.DateTimeField(u"Дата создания статьи", auto_now_add=True)
  date_approved = models.DateTimeField(u"Дата последнего изменения статьи", auto_now=True)
  org_from = models.ForeignKey(OrganizationProfile, verbose_name=u"Отправитель запроса", related_name="sender")
  org_to = models.ForeignKey(OrganizationProfile, verbose_name=u"Адресат запроса", related_name="recipient")
  approved = models.BooleanField(u"Подтвержден", default=False)


# Категория товаров
class ProductCategory(models.Model):
  class Meta:
    verbose_name = u"Категория товаров"
    verbose_name_plural = u"Категории товаров"

  name = models.CharField(u"Наименование категории", max_length=100)

  def __unicode__(self):
    return self.name


# Вид товара
class ProductType(models.Model):
  class Meta:
    verbose_name = u"Вид товара"
    verbose_name_plural = u"Виды товаров"

  name = models.CharField(u"Вид товара", max_length=100)
  category = models.ForeignKey(ProductCategory, verbose_name=u"Категория товара", null=False, blank=False)
  logo = models.ImageField(u'Изображение', upload_to=save_product_image, blank=True, default=None)

  def __unicode__(self):
    return self.name


# Единица товара
class Product(models.Model):
  class Meta:
    verbose_name = u"Товар"
    verbose_name_plural = u"Товары"

  name = models.CharField(u"Название товара", max_length=200, null=False, blank=False)
  description = models.CharField(u"Описание товара", max_length=500, null=True, blank=True)
  ptype = models.ForeignKey(ProductType, verbose_name=u"Вид товара", null=False, blank=False)
  image = models.ImageField(u"Изображение", upload_to=save_product_image, blank=True, default=None)

  def __unicode__(self):
    return self.name


# Продаваемый организацией товар
class SellingProduct(models.Model):
  class Meta:
    verbose_name = u"Продаваемый организацией товар"
    verbose_name_plural = u"Продаваемые организациями товары"

  org = models.ForeignKey(OrganizationProfile, verbose_name=u"Организация, продающая товар", null=False, blank=False)
  product = models.ForeignKey(Product, verbose_name=u"Товар", null=False, blank=False)
  price = models.BigIntegerField(u"Цена товара(бел. руб.)", null=False, blank=False)

  def __unicode__(self):
    return u"Организация: {0}, Товар: {1}, Цена: {2}".format(self.org.name, self.product.name, self.price)
