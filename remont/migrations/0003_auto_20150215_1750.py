# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0002_city_organizationprofile'),
    ]

    operations = [
        migrations.AddField(
            model_name='organizationprofile',
            name='description',
            field=models.TextField(verbose_name='\u041e\u0431\u0448\u0430\u044f \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u044f \u043e\u0431 \u043e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u0438', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='organizationprofile',
            name='email',
            field=models.EmailField(max_length=100, verbose_name='\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u043d\u044b\u0439 e-mail', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='organizationprofile',
            name='fax',
            field=models.CharField(max_length=40, verbose_name='\u041d\u043e\u043c\u0435\u0440 \u0444\u0430\u043a\u0441\u0430', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='organizationprofile',
            name='landline_phone',
            field=models.CharField(max_length=30, verbose_name='\u0421\u0442\u0430\u0446\u0438\u043e\u043d\u0430\u0440\u043d\u044b\u0439 \u0442\u0435\u043b\u0435\u0444\u043e\u043d', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='organizationprofile',
            name='mobile_phone',
            field=models.CharField(max_length=30, verbose_name='\u041c\u043e\u0431\u0438\u043b\u044c\u043d\u044b\u0439 \u0442\u0435\u043b\u0435\u0444\u043e\u043d', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='organizationprofile',
            name='type',
            field=models.CharField(default='\u0427\u0430\u0441\u0442\u043d\u043e\u0435 \u0441\u0442\u0440\u043e\u0438\u0442\u0435\u043b\u044c\u0441\u0442\u0432\u043e', max_length=50, verbose_name='\u041f\u0440\u043e\u0444\u0438\u043b\u044c \u0440\u0430\u0431\u043e\u0442', choices=[('industrial', '\u041f\u0440\u043e\u043c\u044b\u0448\u043b\u0435\u043d\u043d\u043e\u0435 \u0441\u0442\u0440\u043e\u0438\u0442\u0435\u043b\u044c\u0441\u0442\u0432\u043e'), ('individual', '\u0427\u0430\u0441\u0442\u043d\u043e\u0435 \u0441\u0442\u0440\u043e\u0438\u0442\u0435\u043b\u044c\u0441\u0442\u0432\u043e')]),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='organizationprofile',
            name='web_site',
            field=models.URLField(max_length=100, verbose_name='Web-\u0441\u0442\u0440\u0430\u043d\u0438\u0446\u0430', blank=True),
            preserve_default=True,
        ),
    ]
