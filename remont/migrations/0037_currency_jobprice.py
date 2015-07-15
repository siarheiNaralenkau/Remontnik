# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0036_auto_20150715_1611'),
    ]

    operations = [
        migrations.CreateModel(
            name='Currency',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('code', models.CharField(max_length=10, null=True, verbose_name='\u041a\u043e\u0434 \u0432\u0430\u043b\u044e\u0442\u044b', blank=True)),
                ('name', models.CharField(default='\u0431\u0435\u043b. \u0440\u0443\u0431', max_length=50, verbose_name='\u041d\u0430\u0438\u043c\u0435\u043d\u043e\u0432\u0430\u043d\u0438\u0435 \u0432\u0430\u043b\u044e\u0442\u044b')),
            ],
            options={
                'verbose_name': '\u0412\u0430\u043b\u044e\u0442\u0430',
                'verbose_name_plural': '\u0412\u0430\u043b\u044e\u0442\u044b',
            },
        ),
        migrations.CreateModel(
            name='JobPrice',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('desc', models.CharField(max_length=200, verbose_name='\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435 \u0440\u0430\u0431\u043e\u0442\u044b')),
                ('price', models.IntegerField(verbose_name='\u0426\u0435\u043d\u0430')),
                ('cur', models.ForeignKey(verbose_name='\u0412\u0430\u043b\u044e\u0442\u0430', blank=True, to='remont.Currency', null=True)),
                ('org', models.ForeignKey(verbose_name='\u041e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u044f', to='remont.OrganizationProfile')),
            ],
            options={
                'verbose_name': '\u0421\u0442\u043e\u0438\u043c\u043e\u0441\u0442\u044c \u0440\u0430\u0431\u043e\u0442\u044b',
                'verbose_name_plural': '\u0421\u0442\u043e\u0438\u043c\u043e\u0441\u0442\u0438 \u0440\u0430\u0431\u043e\u0442',
            },
        ),
    ]
