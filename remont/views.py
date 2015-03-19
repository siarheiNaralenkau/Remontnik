# -*- coding: utf-8 -*-

from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.core import serializers

from rem_forms import SuggestJobForm

# Главная страница приложения
from remont.models import WorkType, WorkCategory, JobSuggestion, UserProfile, OrganizationProfile, City


def index(request):
    top10 = {'top10 masters': 'top10 masters should be displayed here'}
    job_suggestions = JobSuggestion.objects.order_by("-date_created")[:5]
    cities = City.objects.all()
    categories = WorkCategory.objects.all()
    suggest_job_form = SuggestJobForm()
    return render(request, 'remont/index.html', {"jobSuggestions": job_suggestions, "cities": cities,
                                                 "categories": categories,
                                                 "suggest_job_form": suggest_job_form})


# Регистрация пользователя
def register(request):
    return render(request, "remont/register.html", {})


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
    orgs = OrganizationProfile.objects.all()
    response_data = []
    for org in orgs:
        job_types = org.job_types.all()
        for job_type in job_types:
            if key_phrase in job_type.name:
                # response_data.append({'orgName': org.name})
                # response_data.append(org.name)
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
    job.save()
    if job_type:
        type_name = job_type.name
    else:
        type_name = u''
    response_data = {'header': job.short_header, 'type_name': type_name,
                     'date_created': job.date_created, 'description': job.description}
    response = JsonResponse(response_data, safe=False)
    return response


# Регистрация нового пользователя
def create_user(request):
    reg_type = request.REQUEST["reg_type"]
    contact_name = request.REQUEST["contact_name"]
    email = request.REQUEST["email"]
    phone = request.REQUEST["phone"]
    password = email
    auth_user = User.objects.create_user(email, email, password)
    user_profile = UserProfile(user_id=auth_user.id, contact_name=contact_name, reg_type=reg_type, phone=phone)
    user_profile.save()
    request.session['user_id'] = user_profile.id
    return redirect("/remont/user_profile")


def user_profile(request):
    profile_data = {}
    if "user_id" in request.session:
        u_profile = UserProfile.objects.get(id=request.session["user_id"])
        profile_data["user_profile"] = u_profile
        return render(request, "remont/user_profile.html", profile_data)


def update_user_profile(request):
    return redirect("/remont/user_profile")


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
    return render(request, 'remont/organization_details.html', {"organization_details": organization_details})


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






