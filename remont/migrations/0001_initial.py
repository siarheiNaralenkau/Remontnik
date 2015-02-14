# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import remont.models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='JobSuggestion',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('short_header', models.CharField(default=b'', help_text='\u041a\u0440\u0430\u0442\u043a\u0438\u0439 \u0437\u0430\u0433\u043e\u043b\u043e\u0432\u043e\u043a \u0437\u0430\u044f\u0432\u043a\u0438', max_length=50, verbose_name='\u041a\u0440\u0430\u0442\u043a\u0438\u0439 \u0437\u0430\u0433\u043e\u043b\u043e\u0432\u043e\u043a \u0437\u0430\u044f\u0432\u043a\u0438')),
                ('contact_name', models.CharField(default=b'', max_length=100, verbose_name='\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u043d\u043e\u0435 \u043b\u0438\u0446\u043e')),
                ('description', models.TextField(default=b'', verbose_name='\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435 \u0440\u0430\u0431\u043e\u0442\u044b')),
                ('phone', models.CharField(default=b'', max_length=25, verbose_name='\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u043d\u044b\u0439 \u0442\u0435\u043b\u0435\u0444\u043e\u043d')),
                ('email', models.EmailField(default=b'', max_length=75, verbose_name='\u042d\u043b\u0435\u043a\u0442\u0440\u043e\u043d\u043d\u0430\u044f \u043f\u043e\u0447\u0442\u0430')),
                ('date_created', models.DateTimeField(auto_now_add=True, verbose_name='\u0414\u0430\u0442\u0430 \u0441\u043e\u0437\u0434\u0430\u043d\u0438\u044f')),
            ],
            options={
                'verbose_name': '\u041f\u0440\u0435\u0434\u043b\u043e\u0436\u0435\u043d\u0438\u0435 \u043f\u043e \u0440\u0430\u0431\u043e\u0442\u0435',
                'verbose_name_plural': '\u041f\u0440\u0435\u0434\u043b\u043e\u0436\u0435\u043d\u0438\u044f \u043f\u043e \u0440\u0430\u0431\u043e\u0442\u0435',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='UserMedia',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('work_file', models.FileField(upload_to=remont.models.save_media_file)),
                ('file_type', models.CharField(default=b'image', max_length=10, verbose_name='\u0422\u0438\u043f \u0437\u0430\u043f\u0438\u0441\u0438 \u0440\u0430\u0431\u043e\u0442\u044b', choices=[(b'video', 'Video'), (b'image', 'Image')])),
            ],
            options={
                'verbose_name': '\u0424\u043e\u0442\u043e \u0438\u043b\u0438 \u0432\u0438\u0434\u0435\u043e \u0440\u0430\u0431\u043e\u0442\u044b \u043c\u0430\u0441\u0442\u0435\u0440\u0430',
                'verbose_name_plural': '\u0424\u043e\u0442\u043e \u0438 \u0432\u0438\u0434\u0435\u043e \u043f\u0440\u0438\u043c\u0435\u0440\u044b \u0440\u0430\u0431\u043e\u0442\u044b \u043c\u0430\u0441\u0442\u0435\u0440\u0430',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('reg_type', models.CharField(default=b'client', max_length=20, verbose_name='\u0412\u0438\u0434 \u0440\u0435\u0433\u0438\u0441\u0442\u0440\u0430\u0446\u0438\u0438', choices=[(b'client', '\u0417\u0430\u043a\u0430\u0437\u0447\u0438\u043a'), (b'master', '\u0418\u0441\u043f\u043e\u043b\u043d\u0438\u0442\u0435\u043b\u044c'), (b'seller', '\u041f\u0440\u043e\u0434\u0430\u0432\u0435\u0446')])),
                ('phone', models.CharField(default=b'', max_length=25, verbose_name='\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u043d\u044b\u0439 \u0442\u0435\u043b\u0435\u0444\u043e\u043d', blank=True)),
                ('contact_name', models.CharField(default=b'', max_length=60, verbose_name='\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u043d\u043e\u0435 \u0438\u043c\u044f', blank=True)),
                ('profile_image', models.ImageField(upload_to=remont.models.save_user_photo, null=True, verbose_name='\u041b\u043e\u0433\u043e\u0442\u0438\u043f \u0438\u043b\u0438 \u0444\u043e\u0442\u043e')),
                ('user', models.OneToOneField(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': '\u0417\u0430\u0440\u0435\u0433\u0438\u0441\u0442\u0440\u0438\u0440\u043e\u0432\u0430\u043d\u043d\u044b\u0439 \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u044c',
                'verbose_name_plural': '\u0417\u0430\u0440\u0435\u0433\u0438\u0441\u0442\u0440\u0438\u0440\u043e\u0432\u0430\u043d\u043d\u044b\u0435 \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u0438',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='WorkCategory',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name='\u041d\u0430\u0438\u043c\u0435\u043d\u043e\u0432\u0430\u043d\u0438\u0435 \u043a\u0430\u0442\u0435\u0433\u043e\u0440\u0438\u0438 \u0440\u0430\u0431\u043e\u0442')),
                ('icon', models.ImageField(null=True, upload_to=remont.models.save_job_icon)),
            ],
            options={
                'verbose_name': '\u041a\u0430\u0442\u0435\u0433\u043e\u0440\u0438\u044f \u0440\u0430\u0431\u043e\u0442',
                'verbose_name_plural': '\u041a\u0430\u0442\u0435\u0433\u043e\u0440\u0438\u0438 \u0440\u0430\u0431\u043e\u0442',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='WorkType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name='\u0412\u0438\u0434 \u0440\u0430\u0431\u043e\u0442\u044b')),
                ('icon', models.ImageField(null=True, upload_to=remont.models.save_job_icon)),
                ('category', models.ForeignKey(verbose_name='\u041a\u0430\u0442\u0435\u0433\u043e\u0440\u0438\u044f \u0440\u0430\u0431\u043e\u0442', to='remont.WorkCategory')),
            ],
            options={
                'verbose_name': '\u0412\u0438\u0434 \u0440\u0430\u0431\u043e\u0442\u044b',
                'verbose_name_plural': '\u0412\u0438\u0434\u044b \u0440\u0430\u0431\u043e\u0442',
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='usermedia',
            name='account',
            field=models.ForeignKey(verbose_name='\u041f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u044c', to='remont.UserProfile', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='jobsuggestion',
            name='job_type',
            field=models.ForeignKey(default=b'', verbose_name='\u0412\u0438\u0434 \u0440\u0430\u0431\u043e\u0442', to='remont.WorkType', null=True),
            preserve_default=True,
        ),
    ]
