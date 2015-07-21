# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import remont.models


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0041_remove_message_org'),
    ]

    operations = [
        migrations.CreateModel(
            name='WorkVideo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('video', models.FileField(upload_to=remont.models.save_work_video, verbose_name='\u0412\u0438\u0434\u0435\u043e \u0441\u0434\u0435\u043b\u0430\u043d\u043d\u043e\u0439 \u0440\u0430\u0431\u043e\u0442\u044b')),
                ('organization', models.ForeignKey(verbose_name='\u041e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u044f', to='remont.OrganizationProfile', null=True)),
            ],
            options={
                'verbose_name': '\u0412\u0438\u0434\u0435\u043e \u0432\u044b\u043f\u043e\u043b\u043d\u0435\u043d\u043d\u043e\u0439 \u0440\u0430\u0431\u043e\u0442\u044b',
                'verbose_name_plural': '\u0412\u0438\u0434\u0435\u043e \u0432\u044b\u043f\u043e\u043b\u043d\u0435\u043d\u043d\u044b\u0445 \u0440\u0430\u0431\u043e\u0442',
            },
        ),
    ]
