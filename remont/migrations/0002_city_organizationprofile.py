# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import remont.models


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=40, verbose_name='\u0413\u043e\u0440\u043e\u0434')),
            ],
            options={
                'verbose_name': '\u0413\u043e\u0440\u043e\u0434',
                'verbose_name_plural': '\u0413\u043e\u0440\u043e\u0434\u0430',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='OrganizationProfile',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name='\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435 \u043e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u0438')),
                ('address', models.CharField(max_length=150, verbose_name='\u0410\u0434\u0440\u0435\u0441')),
                ('logo', models.ImageField(upload_to=remont.models.save_organization_logo, null=True, verbose_name='\u041b\u043e\u0433\u043e\u0442\u0438\u043f \u043e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u0438')),
                ('city', models.ForeignKey(verbose_name='\u0413\u043e\u0440\u043e\u0434 \u0440\u0435\u0433\u0438\u0441\u0442\u0440\u0430\u0446\u0438\u0438', to='remont.City')),
                ('job_types', models.ManyToManyField(to='remont.WorkType', verbose_name='\u0412\u0438\u0434\u044b \u0432\u044b\u043f\u043e\u043b\u043d\u044f\u0435\u043c\u044b\u0445 \u0440\u0430\u0431\u043e\u0442')),
            ],
            options={
                'verbose_name': '\u041e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u044f',
                'verbose_name_plural': '\u041e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u0438',
            },
            bases=(models.Model,),
        ),
    ]
