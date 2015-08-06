# -*- coding: utf-8 -*-

from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.core import serializers

from remont.rem_forms import RegisterForm, OrganizationProfileModelForm, SuggestJobForm, OrganizationEditForm, UploadPhotoForm
from remont.models import WorkType, WorkCategory, JobSuggestion, OrganizationProfile, City, WorkSpec, \
                          WorkPhotoAlbum, WorkPhoto, Message, Review

from lastActivityDate.users_activity_service import get_last_visit

from django.conf import settings
from django.contrib.auth import authenticate, login, logout

from remont.mail_sending_service import send_confirm_registration

from django.forms.formsets import formset_factory

from  django.contrib.auth.hashers import check_password

# Главная страница приложения
def index(request):
    top10 = {'top10 masters': 'top10 masters should be displayed here'}
    job_suggestions = JobSuggestion.objects.order_by("-date_created")[:5]
    cities = City.objects.all()
    categories = WorkCategory.objects.all()
    suggest_job_form = SuggestJobForm()
    response_data = {"jobSuggestions": job_suggestions, "cities": cities, "logged_in": False, "categories": categories, "suggest_job_form": suggest_job_form}
    # Check if user is logged in.
    if request.user.is_authenticated():
        response_data["logged_in"] = True
        newMessages = Message.objects.filter(was_read__isnull=True, msg_to=request.user)
        response_data["newMesagesAmount"] = len(newMessages)

    return render(request, 'remont/index.html', response_data)


# Регистрация пользователя
def register(request):
    reg_form = RegisterForm()
    return render(request, "remont/register.html", {"reg_form": reg_form})


# Страница предложения о работе.
def suggest_job(request):
    work_types = WorkType.objects.all()
    # Авторизация еще не реализована
    is_autorized = False
    return render(request, "remont/suggest_job.html", {"is_autorized": is_autorized, "work_types": work_types})


# Сохранение предложения о работе
def suggest_job_save(request):
  contact_person = unicode(request.REQUEST["contactPerson"])
  work_type = request.REQUEST["workType"]
  description = unicode(request.REQUEST["description"])
  phone = request.REQUEST["phone"]
  mail = request.REQUEST["mail"]
  header = request.REQUEST["shortHeader"]

  job_type = WorkType.objects.get(pk=int(work_type))
  job = JobSuggestion(contact_name=contact_person, job_type=job_type, description=description,
                      phone=phone, email=mail, short_header=header)
  job.save()
  return redirect("/remont")


# Поиск организации по ключевым словам
def search_organizations(request):
  key_phrase = request.REQUEST["q"]
  response_data = []
  # 1) Поиск по имени организации
  orgs_by_name = OrganizationProfile.objects.filter(name__istartswith=key_phrase)
  for org in orgs_by_name:
    if org.logo:
        logo_url = "/remont/" + org.logo.url
    else:
        logo_url = "/static/remont/images/question.jpg"
    response_data.append({"id": org.id, "name": org.name, "logo": logo_url})

  # 2) Поиск по типу выполняемых работ.
  orgs_by_job_type = OrganizationProfile.objects.all()
  for org in orgs_by_job_type:
    job_types = org.job_types.all()
    for job_type in job_types:
      if key_phrase in job_type.name:
        if org.logo:
          logo_url = "/remont/" + org.logo.url
        else:
          logo_url = "/remont/static/remont/images/question.jpg"
        response_data.append({"id": org.id, "name": org.name, "logo": logo_url})
        break

    print "Found {0} organizations: ".format(len(response_data))
    response = JsonResponse(response_data, safe=False)
    return response

def search_orgs_html(request):
  key_phrase = request.REQUEST["q"]
  response_data = []
  # 1) Поиск по имени организации
  orgs_by_name = OrganizationProfile.objects.filter(name__istartswith=key_phrase)
  for org in orgs_by_name:
    if org.logo:
        logo_url = "/remont/" + org.logo.url
    else:
        logo_url = "/static/remont/images/question.jpg"
    response_data.append({"id": org.id, "name": org.name, "logo": logo_url})

  # 2) Поиск по типу выполняемых работ.
  orgs_by_job_type = OrganizationProfile.objects.all()
  for org in orgs_by_job_type:
    job_types = org.job_types.all()
    for job_type in job_types:
      if key_phrase in job_type.name:
        if org.logo:
          logo_url = "/remont/" + org.logo.url
        else:
          logo_url = "/remont/static/remont/images/question.jpg"
        response_data.append({"id": org.id, "name": org.name, "logo": logo_url})
        break

    print "Found {0} organizations: ".format(len(response_data))
    return render(request, 'remont/search_orgs.html', {"organizatins": response_data})


@csrf_exempt
def suggest_job_save_ajax(request):
    job_type_id = request.POST["job_type"]
    if job_type_id:
        job_type = WorkType.objects.filter(id=job_type_id).first()
    else:
        job_type = None
    job = JobSuggestion(contact_name=request.POST["contact_name"],
                        job_type=job_type,
                        description=request.POST["job_description"],
                        phone=request.POST["contact_phone"],
                        email=request.POST["contact_mail"],
                        short_header=request.POST["job_header"])
    job_spec = request.POST["job_spec"]
    work_spec = WorkSpec.objects.get(id=int(job_spec))
    job.job_spec = work_spec
    job.save()
    if job_type:
        type_name = job_type.name
    else:
        type_name = u''
    response_data = {'header': job.short_header, 'type_name': type_name,
                     'date_created': job.date_created, 'description': job.description}
    response = JsonResponse(response_data, safe=False)
    return response


# Отображает список организаций
def organizations_list(request):
    # city_id = request.REQUEST["city"]
    # organizations = OrganizationProfile.objects.filter(city=city_id)
    organizations = OrganizationProfile.objects.all()
    return render(request, 'remont/organizations_list.html', {"organizatins": organizations})


# Получает список видо работ по категории
def get_job_types_by_category(request):
    category_id = request.GET["category_id"]
    category = WorkCategory.objects.get(pk=category_id)
    work_types = WorkType.objects.filter(category=category)
    response_data = []
    for w_type in work_types:
        response_data.append({'id': w_type.id, 'name': w_type.name})
    response = JsonResponse(response_data, safe=False)
    return response


# Создает новую организацию на основе заполненной пользователем формы.
@csrf_exempt
def create_organization(request):
    if request.method == "POST":
        reg_form = RegisterForm(request.POST, request.FILES)
        if reg_form.is_valid():
            org = OrganizationProfile()
            org.name = reg_form.cleaned_data["name"]
            org.logo = reg_form.cleaned_data["logo"]
            # city_id = int(reg_form.cleaned_data["city"])
            # org.city = City.objects.filter(id=city_id).first()
            org.city = reg_form.cleaned_data["city"]
            org.address = reg_form.cleaned_data["address"]
            org.description = reg_form.cleaned_data["description"]
            org.landline_phone = reg_form.cleaned_data["landing_phone"]
            org.mobile_phone = reg_form.cleaned_data["mobile_phone"]
            org.mobile_phone2 = reg_form.cleaned_data["mobile_phone2"]
            org.fax = reg_form.cleaned_data["fax"]
            org.web_site = reg_form.cleaned_data["web_site"]
            org.email = reg_form.cleaned_data["email"]

            org.login = reg_form.cleaned_data["login"]
            password = reg_form.cleaned_data["password"]
            password_repeat = reg_form.cleaned_data["password_repeat"]
            org.password = password

            org.save()

            # Save Work in cities.
            work_cities = reg_form.cleaned_data["work_cities"]
            for c in work_cities:
                org.work_cities.add(c)

            # Save job types
            job_types = reg_form.cleaned_data["job_types"]
            for jt in job_types:
                org.job_types.add(jt)

            send_confirm_registration(org.email, org.account.id)
            return render(request, 'remont/confirm_registration.html', {})
        else:
            return render(request, "remont/register.html", {"reg_form": reg_form})


# Вход на сайт
@csrf_exempt
def site_login(request):
    response_data = {}
    uname = request.POST["login"]
    passwd = request.POST["password"]
    user = authenticate(username=uname, password=passwd)

    response_data = {}

    if user is None:
        # Попытка авторизации, используя имя организации
        org = OrganizationProfile.objects.filter(name=uname).first()
        if org:
            uname = org.account.username
            user = authenticate(username=uname, password=passwd)

    if user is not None:
        if user.is_active:
            login(request, user)
            response_data["status"] = "success"
            return JsonResponse(response_data, safe=False)
        else:
            response_data["status"] = "error"
            response_data["error_message"] = u"Аккаунт пользователя {0} не активирован!".format(uname)
    else:
        response_data["status"] = "error"
        response_data["error_message"] = "Неправильное имя пользователя или пароль"

    response = JsonResponse(response_data, safe=False)
    return response


# Выход с сайта
@csrf_exempt
def site_logout(request):
    logout(request)
    return redirect("/remont")


# Получаем фотографии из альбома.
def get_album_photos(request):
    album_photos = []
    album_id = request.GET["album_id"]
    photo_album = WorkPhotoAlbum.objects.filter(id=album_id).first()
    if photo_album:
        photos = WorkPhoto.objects.filter(album=photo_album)
        for photo_obj in photos:
            album_photos.append({'id': photo_obj.id, 'url': photo_obj.photo.url})
    response = JsonResponse(album_photos, safe=False)
    return response


# Получаем список организаций(Для страницы)
def get_orgs_list(request):
    orgs_list = list(OrganizationProfile.objects.all().order_by('name'))
    print("Amount of organizations: {0}".format(len(orgs_list)))
    return render(request, 'remont/orgs_list.html', {"orgs_list": orgs_list})

def view_profile(request):
    return render(request, "remont/view_profile.html", {"org_id": request.GET["org_id"]})

# Получаем информацию об организации в формате JSON
def get_profile_info(request):
    org_id = request.GET["org_id"]
    org_profile = OrganizationProfile.objects.filter(id=org_id).first()
    profile_json = {"id": org_profile.id, "name": org_profile.name, "city": org_profile.city.name,
                    "address": org_profile.address, "rating": 3.5}

    if org_profile.logo:
        profile_json["logo_url"] = org_profile.logo.url
    else:
        profile_json["logo_url"] = "/remont/static/remont/images/question.jpg"

    collegs = org_profile.collegues.all()
    collegs_array = []
    for c in collegs:
        colleg_item = {"id": c.id, "name": c.name}
        if c.logo:
            colleg_item["logo_url"] = c.logo.url
        else:
            colleg_item["logo_url"] = ""
        collegs_array.append(colleg_item)
    profile_json["collegues"] = collegs_array

    job_types = [job.name for job in org_profile.job_types.all()]
    profile_json["job_types"] = job_types

    contacts = []
    if org_profile.landline_phone:
        contacts.append(org_profile.landline_phone)
    if org_profile.mobile_phone:
        contacts.append(org_profile.mobile_phone)
    if org_profile.mobile_phone2:
        contacts.append(org_profile.mobile_phone2)
    if org_profile.fax:
        contacts.append(org_profile.fax)
    if org_profile.web_site:
        contacts.append(org_profile.web_site)
    if org_profile.email:
        contacts.append(org_profile.email)
    profile_json["contacts"] = contacts

    profile_json["address"] = org_profile.address

    profile_json["about"] = org_profile.description

    photos = WorkPhoto.objects.filter(organization=org_profile)

    profile_json["photos"] = [p.photo.url for p in photos]

    if org_profile.account:
        print("Organization user: {0}".format(org_profile.account.id))
        profile_json["last_visit"] = get_last_visit(org_profile.account.id)
    else:
        profile_json["last_visit"] = 'Never'

    reviews = Review.objects.filter(org=org_profile)
    profile_json["reviews_amount"] = len(reviews)

    response = JsonResponse(profile_json, safe=False)
    return response


# Отправляем сообщение организации(Другому пользователю)
@csrf_exempt
def send_text_mesaage(request):
    response_data = {}
    sender = None
    receiver_id = request.POST["org_id"]
    receiver_org = OrganizationProfile.objects.filter(id=receiver_id).first()
    if receiver_org.account:
        message_text = request.POST["message"]
        if request.user.is_authenticated():
            print 'User is authenticated!'
            sender = request.user
        msg = Message(msg_to=receiver_org.account, msg_from=sender, text=message_text)
        msg.save()
        print "Message was successfully send"
        response_data["status"] = "success"
    else:
        print "Error during message sending."
        response_data["status"] = "error"
        response_data["error_message"] = u"Организация {0} еще не активизировала свой аккаунт на сайте".format(receiver_org.name)

    return JsonResponse(response_data, safe=False)


# Подтверждение пользователем своей регистрации
def confirm_registration(request):
    user_id = request.GET["user_id"]
    if user_id:
        account = User.objects.filter(id=user_id).first()
        account.is_active = True
        account.save()
        print "Account was activated successfully!"

    return redirect("/remont")


# Редактируем профайл организации
@csrf_exempt
def edit_organization(request, id=None):
    if id:
        user = get_object_or_404(User, pk=id)
        org = get_object_or_404(OrganizationProfile, account=user)

        if request.POST:
            profile_form = OrganizationEditForm(request.POST, request.FILES, instance=org)
            if profile_form.is_valid():
                profile_form.save()
                return redirect('/remont/edit_organization/' + str(id))
        else:
            profile_form = OrganizationEditForm(instance=org)
            photo_albums = WorkPhotoAlbum.objects.filter(organization=org)
            grouped_photos = []
            photos_amount = 0
            for ph_album in photo_albums:
                photos = WorkPhoto.objects.filter(album=ph_album)
                photos_amount += len(photos)
                album_info = {"id": ph_album.id, "name": ph_album.name, "photos": photos}
                grouped_photos.append(album_info)
            ungrouped_photos = WorkPhoto.objects.filter(organization=org, album__isnull=True)
            photos_amount += len(ungrouped_photos)
            if len(ungrouped_photos) > 0:
                unnamed_album = {"id": 0, "name": u"Другие фотографии", "photos": ungrouped_photos}
                grouped_photos.append(unnamed_album)

            UploadPhotoFormSet = formset_factory(UploadPhotoForm)
            photo_formset = UploadPhotoFormSet()

            return render(request, "remont/edit_profile.html", {"profile_form": profile_form,
                                                                "work_photos": grouped_photos,
                                                                "photos_amount": photos_amount,
                                                                "photo_formset": photo_formset})

# Загрузка фотографий выполненных работ
@csrf_exempt
def upload_work_photos(request):
    org = OrganizationProfile.objects.filter(account = request.user).first()
    if request.method == "POST":
        files_to_upload = request.FILES.getlist("uploadPhoto")
        album_id = request.POST["albumId"]
        if album_id:
            for f in files_to_upload:
                photo_obj = WorkPhoto(organization=org, photo=f, album=WorkPhotoAlbum.objects.filter(id=int(album_id)).first())
                photo_obj.save()
            return redirect("/remont/edit_album?album_id=" + album_id)
        else:
            for f in files_to_upload:
                photo_obj = WorkPhoto(organization=org, photo=f)
                photo_obj.save()
            return redirect("/remont/edit_profile?user_id=" + str(request.user.id))


# Создание нового фотоальбома
@csrf_exempt
def create_photo_album(request):
    org = OrganizationProfile.objects.filter(account = request.user).first()
    album = WorkPhotoAlbum(organization=org, name=request.POST["albumName"])
    album.save()
    response_data = {"id": album.id, "name": album.name, "photos": []}
    return JsonResponse(response_data, safe=False)


# Редактирование фотоальбома организации
def edit_album(request):
    album_id = request.GET["album_id"]
    album = WorkPhotoAlbum.objects.filter(id=int(album_id)).first()
    photos = WorkPhoto.objects.filter(album=album)
    return render(request, "remont/edit_album.html", {"album": album, "photos": photos})


# Удаление фотографии
@csrf_exempt
def delete_photo(request):
    photo_id = request.POST["photo_id"]
    WorkPhoto.objects.filter(id=int(photo_id)).delete()
    return JsonResponse({"photoId": photo_id}, safe=False)


# Изменение пароля акканта организации
@csrf_exempt
def change_password(request):
  if request.method == "POST":
    response_data = {}
    old_pass = request.POST["old_password"]
    new_pass = request.POST["new_password"]

    if request.user.is_authenticated():
      if check_password(old_pass, request.user.password):
        request.user.set_password(new_pass)
        request.user.save()
        response_data["status"] = "success"
      else:
        response_data["status"] = "failure"
        response_data["error"] = "Неправильный текущий пароль"

      return JsonResponse(response_data, safe=False)
    else:
      res = HttpResponse("Unautorized")
      res.status_code = 401
      return res


# Каталог работ
def jobs_list(request):
  work_types = WorkType.objects.order_by("category")
  types_data = {}
  for wt in work_types:
    if wt.category in types_data:
      types_data[wt.category].append(wt)
    else:
      types_data[wt.category] = [wt]

  print("Categories amount: {0}".format(len(types_data)))
  return render(request, "remont/jobs_list.html", {"job_types": types_data})


# Получаем список организаций, выполняющий определенный вид работ
def get_orgs_by_job_type(request):
  job_type_id = request.GET["jobId"]
  job_type = WorkType.objects.filter(id=job_type_id).first()
  orgs_list = OrganizationProfile.objects.filter(job_types__id__exact=job_type_id)
  print("Organizations list length: {0}".format(len(orgs_list)))
  return render(request, "remont/job_orgs_list.html", {"orgs_list": orgs_list, "job_type": job_type})
