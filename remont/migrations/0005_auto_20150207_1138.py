# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import remont.models


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0004_auto_20150207_0920'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserMedia',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('work_file', models.FileField(upload_to=remont.models.save_media_file)),
                ('file_type', models.CharField(default=b'image', max_length=10, verbose_name='\u0422\u0438\u043f \u0437\u0430\u043f\u0438\u0441\u0438 \u0440\u0430\u0431\u043e\u0442\u044b', choices=[(b'video', 'Video'), (b'image', 'Image')])),
                ('account', models.ForeignKey(verbose_name='\u041f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u044c', to='remont.UserProfile', null=True)),
            ],
            options={
                'verbose_name': '\u0424\u043e\u0442\u043e \u0438\u043b\u0438 \u0432\u0438\u0434\u0435\u043e \u0440\u0430\u0431\u043e\u0442\u044b \u043c\u0430\u0441\u0442\u0435\u0440\u0430',
                'verbose_name_plural': '\u0424\u043e\u0442\u043e \u0438 \u0432\u0438\u0434\u0435\u043e \u043f\u0440\u0438\u043c\u0435\u0440\u044b \u0440\u0430\u0431\u043e\u0442\u044b \u043c\u0430\u0441\u0442\u0435\u0440\u0430',
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='userprofile',
            name='profile_image',
            field=models.ImageField(upload_to=remont.models.save_user_photo, null=True, verbose_name='\u041b\u043e\u0433\u043e\u0442\u0438\u043f \u0438\u043b\u0438 \u0444\u043e\u0442\u043e'),
            preserve_default=True,
        ),
    ]
