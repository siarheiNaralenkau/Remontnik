# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('remont', '0039_remove_message_msg_from'),
    ]

    operations = [
        migrations.AddField(
            model_name='message',
            name='msg_from',
            field=models.ForeignKey(related_name='sender', verbose_name='\u0410\u0432\u0442\u043e\u0440 \u0441\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u044f', blank=True, to=settings.AUTH_USER_MODEL, null=True),
        ),
        migrations.AddField(
            model_name='message',
            name='msg_to',
            field=models.ForeignKey(related_name='receiver', default=None, verbose_name='\u041f\u043e\u043b\u0443\u0447\u0430\u0442\u0435\u043b\u044c \u0441\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u044f', to=settings.AUTH_USER_MODEL),
        ),
    ]
