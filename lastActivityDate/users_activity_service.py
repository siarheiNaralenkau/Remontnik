from django.contrib.auth.models import User
from datetime import datetime, timedelta
from lastActivityDate.models import UserActivity
 
def get_online_users(num):
    fifteen_minutes = datetime.now() - timedelta(minutes=15)
    sql_datetime = datetime.strftime(fifteen_minutes, '%Y-%m-%d %H:%M:%S')
    users = UserActivity.objects.filter(last_activity_date__gte=sql_datetime, user__is_active__exact=1).order_by('-last_activity_date')[:num]
    return [u.user for u in users]