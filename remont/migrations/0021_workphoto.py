# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import remont.models


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0020_workphotoalbum'),
    ]

    operations = [
        migrations.CreateModel(
            name='WorkPhoto',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('photo', models.ImageField(upload_to=remont.models.save_work_photo, verbose_name='\u0424\u043e\u0442\u043e \u0441\u0434\u0435\u043b\u0430\u043d\u043d\u043e\u0439 \u0440\u0430\u0431\u043e\u0442\u044b')),
                ('album', models.ForeignKey(verbose_name='\u0410\u043b\u044c\u0431\u043e\u043c', to='remont.WorkPhotoAlbum')),
            ],
            options={
                'verbose_name': '\u0424\u043e\u0442\u043e\u0433\u0440\u0430\u0444\u0438\u044f \u0432\u044b\u043f\u043e\u043b\u043d\u0435\u043d\u043d\u043e\u0439 \u0440\u0430\u0431\u043e\u0442\u044b',
                'verbose_name_plural': '\u0424\u043e\u0442\u043e\u0433\u0440\u0430\u0444\u0438\u0438 \u0432\u044b\u043f\u043e\u043b\u043d\u0435\u043d\u043d\u044b\u0445 \u0440\u0430\u0431\u043e\u0442',
            },
            bases=(models.Model,),
        ),
    ]
