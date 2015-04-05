# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0019_organizationprofile_login'),
    ]

    operations = [
        migrations.CreateModel(
            name='WorkPhotoAlbum',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=60, verbose_name='\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435 \u0430\u043b\u044c\u0431\u043e\u043c\u0430')),
                ('organization', models.ForeignKey(verbose_name='\u041e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u044f', to='remont.OrganizationProfile')),
            ],
            options={
                'verbose_name': '\u0424\u043e\u0442\u043e\u0430\u043b\u044c\u0431\u043e\u043c \u043e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u0438',
                'verbose_name_plural': '\u0424\u043e\u0442\u043e\u0430\u043b\u044c\u0431\u043e\u043c\u044b \u043e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u0438',
            },
            bases=(models.Model,),
        ),
    ]
