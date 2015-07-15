from django.db import models
from django.contrib.auth.models import User
from datetime import datetime

class UserActivity(models.Model):
    last_activity_ip = models.IPAddressField()
    last_activity_date = models.DateTimeField(default=None)
    user = models.OneToOneField(User, primary_key=True)

