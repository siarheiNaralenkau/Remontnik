# -*- coding: utf-8 -*-

from django.contrib.auth.models import User
from datetime import datetime, timedelta
from django.utils import timezone
from lastActivityDate.models import UserActivity

import locale
 
def get_online_users(num):
    fifteen_minutes = timezone.now() - timedelta(minutes=15)
    sql_datetime = datetime.strftime(fifteen_minutes, '%Y-%m-%d %H:%M:%S')
    users = UserActivity.objects.filter(last_activity_date__gte=sql_datetime, user__is_active__exact=1).order_by('-last_activity_date')[:num]
    return [u.user for u in users]

# Метод возвращает врем последнего посещения пользователем сайта(Online, если сейчас на сайте)
def get_last_visit(user_id):
    last_visit = ""    
    checked_user = User.objects.filter(id=user_id).first()
    fifteen_minutes = timedelta(minutes=15)
    activity = UserActivity.objects.filter(user=checked_user).first()
    if activity:
        activity_delta = timezone.now() - activity.last_activity_date        
        if activity_delta < fifteen_minutes:    
            last_visit = "Online"
        else:             
            last_visit = u"Заходил " + datetime.strftime(activity.last_activity_date, "%d-%m-%Y %H:%M")            
    else:
        last_visit = 'Never'    
    return last_visit
