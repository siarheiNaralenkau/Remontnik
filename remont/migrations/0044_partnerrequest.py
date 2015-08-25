# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0043_auto_20150728_0923'),
    ]

    operations = [
        migrations.CreateModel(
            name='PartnerRequest',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date_created', models.DateTimeField(auto_now_add=True, verbose_name='\u0414\u0430\u0442\u0430 \u0441\u043e\u0437\u0434\u0430\u043d\u0438\u044f \u0441\u0442\u0430\u0442\u044c\u0438')),
                ('date_approved', models.DateTimeField(auto_now=True, verbose_name='\u0414\u0430\u0442\u0430 \u043f\u043e\u0441\u043b\u0435\u0434\u043d\u0435\u0433\u043e \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u0438\u044f \u0441\u0442\u0430\u0442\u044c\u0438')),
                ('approved', models.BooleanField(default=False, verbose_name='\u041f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d')),
                ('org_from', models.ForeignKey(related_name='sender', verbose_name='\u041e\u0442\u043f\u0440\u0430\u0432\u0438\u0442\u0435\u043b\u044c \u0437\u0430\u043f\u0440\u043e\u0441\u0430', to='remont.OrganizationProfile')),
                ('org_to', models.ForeignKey(related_name='recipient', verbose_name='\u0410\u0434\u0440\u0435\u0441\u0430\u0442 \u0437\u0430\u043f\u0440\u043e\u0441\u0430', to='remont.OrganizationProfile')),
            ],
            options={
                'verbose_name': '\u0417\u0430\u043f\u0440\u043e\u0441 \u043d\u0430 \u0434\u043e\u0431\u0430\u0432\u043b\u043d\u0435\u043d\u0438\u0435 \u0432 \u043f\u0430\u0440\u0442\u043d\u0435\u0440\u044b',
                'verbose_name_plural': '\u0417\u0430\u043f\u0440\u043e\u0441\u044b \u043d\u0430 \u0434\u043e\u0431\u0430\u0432\u043b\u0435\u043d\u0438\u0435 \u0432 \u043f\u0430\u0440\u0442\u043d\u0435\u0440\u044b',
            },
        ),
    ]
