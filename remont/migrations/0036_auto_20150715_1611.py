# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('remont', '0035_organizationprofile_account'),
    ]

    operations = [
        migrations.CreateModel(
            name='CustomerProfile',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name=b'\xd0\x9a\xd0\xbe\xd0\xbd\xd1\x82\xd0\xb0\xd0\xba\xd1\x82\xd0\xbd\xd0\xbe\xd0\xb5 \xd0\xb8\xd0\xbc\xd1\x8f \xd0\xb7\xd0\xb0\xd0\xba\xd0\xb0\xd0\xb7\xd1\x87\xd0\xb8\xd0\xba\xd0\xb0')),
                ('password', models.CharField(default=None, max_length=120, null=True, verbose_name='\u041f\u0430\u0440\u043e\u043b\u044c', blank=True)),
                ('login', models.CharField(default=None, max_length=100, null=True, verbose_name='\u041b\u043e\u0433\u0438\u043d \u043d\u0430 \u0441\u0430\u0439\u0442\u0435', blank=True)),
                ('account', models.ForeignKey(verbose_name='\u0410\u043a\u043a\u0430\u0443\u043d\u0442', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
                'verbose_name': '\u041f\u0440\u043e\u0434\u0430\u0432\u0435\u0446',
                'verbose_name_plural': '\u041f\u0440\u043e\u0434\u0430\u0432\u0446\u044b',
            },
        ),
        migrations.CreateModel(
            name='Message',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('text', models.CharField(max_length=1000, verbose_name='\u0421\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u0435')),
                ('msg_from', models.ForeignKey(default='\u0410\u043d\u043e\u043d\u0438\u043c\u043d\u044b\u0439 \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u044c', blank=True, to=settings.AUTH_USER_MODEL, null=True, verbose_name='\u0410\u0432\u0442\u043e\u0440 \u0441\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u044f')),
                ('org', models.ForeignKey(verbose_name='\u041e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u044f', to='remont.OrganizationProfile')),
            ],
            options={
                'verbose_name': '\u0421\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u0435',
                'verbose_name_plural': '\u0421\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u044f',
            },
        ),
        migrations.CreateModel(
            name='Review',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('mark', models.IntegerField(verbose_name='\u041e\u0446\u0435\u043d\u043a\u0430', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(5)])),
                ('good', models.CharField(max_length=200, verbose_name='\u041f\u043b\u044e\u0441\u044b')),
                ('bad', models.CharField(max_length=200, verbose_name='\u041c\u0438\u043d\u0443\u0441\u044b')),
                ('org', models.ForeignKey(verbose_name='\u041e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u044f', to='remont.OrganizationProfile')),
            ],
            options={
                'verbose_name': '\u041e\u0442\u0437\u044b\u0432 \u043e \u0440\u0430\u0431\u043e\u0442\u0435',
                'verbose_name_plural': '\u041e\u0442\u0437\u044b\u0432\u044b \u043e \u0440\u0430\u0431\u043e\u0442\u0435',
            },
        ),
        migrations.CreateModel(
            name='SellerProfile',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name=b'\xd0\x9d\xd0\xb0\xd0\xb8\xd0\xbc\xd0\xb5\xd0\xbd\xd0\xbe\xd0\xb2\xd0\xb0\xd0\xbd\xd0\xb8\xd0\xb5 \xd0\xbf\xd1\x80\xd0\xbe\xd0\xb4\xd0\xb0\xd0\xb2\xd1\x86\xd0\xb0')),
                ('password', models.CharField(default=None, max_length=120, null=True, verbose_name='\u041f\u0430\u0440\u043e\u043b\u044c', blank=True)),
                ('login', models.CharField(default=None, max_length=100, null=True, verbose_name='\u041b\u043e\u0433\u0438\u043d \u043d\u0430 \u0441\u0430\u0439\u0442\u0435', blank=True)),
                ('account', models.ForeignKey(verbose_name='\u0410\u043a\u043a\u0430\u0443\u043d\u0442', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
                'verbose_name': '\u041f\u0440\u043e\u0434\u0430\u0432\u0435\u0446',
                'verbose_name_plural': '\u041f\u0440\u043e\u0434\u0430\u0432\u0446\u044b',
            },
        ),
        migrations.RemoveField(
            model_name='userprofile',
            name='user',
        ),
        migrations.AlterField(
            model_name='usermedia',
            name='account',
            field=models.ForeignKey(verbose_name='\u0410\u043a\u043a\u0430\u0443\u043d\u0442 \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u044f', to=settings.AUTH_USER_MODEL, null=True),
        ),
        migrations.DeleteModel(
            name='UserProfile',
        ),
    ]
