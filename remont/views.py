# -*- coding: utf-8 -*-

from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.core import serializers

from rem_forms import SuggestJobForm

# Главная страница приложения
from remont.rem_forms import RegisterForm, OrganizationProfileModelForm
from remont.models import WorkType, WorkCategory, JobSuggestion, OrganizationProfile, City, WorkSpec, \
                          WorkPhotoAlbum, WorkPhoto, Message

from django.conf import settings
from django.contrib.auth import authenticate, login, logout

def index(request):
    top10 = {'top10 masters': 'top10 masters should be displayed here'}
    job_suggestions = JobSuggestion.objects.order_by("-date_created")[:5]
    cities = City.objects.all()
    categories = WorkCategory.objects.all()
    suggest_job_form = SuggestJobForm()
    response_data = {"jobSuggestions": job_suggestions, "cities": cities, "logged_in": False, "categories": categories, "suggest_job_form": suggest_job_form}
    # Check if user is logged in.
    if request.user.is_authenticated():
        print "User is logged in!"
        response_data["logged_in"] = True
        newMessages = Message.objects.filter(was_read__isnull=True)
        response_data["newMesagesAmount"] = len(newMessages)

    return render(request, 'remont/index.html', response_data)

# Регистрация пользователя
def register(request):
    reg_form = OrganizationProfileModelForm()
    return render(request, "remont/register.html", {"reg_form": reg_form})


# Личный кабинет пользователя
def profile(request, user_id):
    return HttpResponse(u"Кабинет пользователя %s" % user_id)


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
        response_data.append({'label': org.name, 'value': org.id})

    # 2) Поиск по типу выполняемых работ.
    orgs_by_job_type = OrganizationProfile.objects.all()
    for org in orgs_by_job_type:
        job_types = org.job_types.all()
        for job_type in job_types:
            if key_phrase in job_type.name:
                response_data.append({'label': org.name, 'value': org.id})
                break
    print "Found {0} organizations: ".format(len(response_data))
    response = JsonResponse(response_data, safe=False)
    return response


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


# Отображает подробную информацию о конкретной организации.
def org_profile(request):
    org_id = request.REQUEST["org"]
    print "Organization id: {0}".format(org_id)
    organization_details = OrganizationProfile.objects.get(id=org_id)
    # Загружаем фото работ организации
    photos = []
    albums = WorkPhotoAlbum.objects.filter(organization=organization_details)
    for cur_album in albums:
        album_photos = WorkPhoto.objects.filter(album=cur_album)
        if len(album_photos) > 0:
            photos.append({'id': cur_album.id, 'name': cur_album.name, 'photos_amount': len(album_photos), 'title_photo': album_photos[0]})
    return render(request, 'remont/organization_details.html', {"organization_details": organization_details,
                                                                "work_photos": photos,
                                                                "mediaRoot": settings.MEDIA_ROOT})


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
def create_organization(request):
    if request.method == "POST":
        reg_form = RegisterForm(request.POST)
        if reg_form.is_valid():
            org = OrganizationProfile()
            org.name = reg_form.cleaned_data["name"]
            org.city = City.objects.get(id=int(reg_form.cleaned_data["reg_city"]))
            org.address = reg_form.cleaned_data["reg_address"]
            job_types = reg_form.cleaned_data["job_types"]
            for j_type in job_types:
                org.job_types.add(j_type)
            org.logo = reg_form.cleaned_data["logo"]
            org.description = reg_form.cleaned_data["description"]
            org.landline_phone = reg_form.cleaned_data["landing_phone"]
            org.mobile_phone = reg_form.cleaned_data["mobile_phone"]
            org.mobile_phone2 = reg_form.cleaned_data["mobile_phone2"]
            org.fax = reg_form.cleaned_data["fax"]
            org.web_site = reg_form.cleaned_data["web_site"]
            org.email = reg_form.cleaned_data["email"]
            org.work_cities = reg_form.cleaned_data["work_cities"]
            org.save()


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

# Установка пароля для организации при первом входе
@csrf_exempt
def set_password(request):
    print 'Defining password for organization...'
    response_data = {}
    org_login = request.POST["login"]
    password = request.POST["password"]
    org = OrganizationProfile.objects.filter(name=org_login).first()
    if not org:
        response_data["status"] = "fail"
        response_data["error"] = "Организации " + org_login + " не существует!"
    else:
        org.password = password
        try:
            org.save()
            response_data["status"] = "success"
            response_data["org_id"] = org.id
        except Exception as e:
            response_data["error"] = e
    response = JsonResponse(response_data, safe=False)
    return response


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
        profile_json["logo_url"] = ""

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
    print("Photos amount: {0}".format(len(photos)))
    profile_json["photos"] = [p.photo.url for p in photos]

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