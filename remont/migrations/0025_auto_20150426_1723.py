# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0024_auto_20150421_1244'),
    ]

    operations = [
        migrations.AddField(
            model_name='jobsuggestion',
            name='job_spec',
            field=models.ForeignKey(default=b'', verbose_name='\u0421\u043f\u0435\u0446\u0438\u0430\u043b\u0438\u0437\u0430\u0446\u0438\u044f', to='remont.WorkSpec', null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='workspec',
            name='name',
            field=models.CharField(max_length=50, verbose_name='\u0421\u043f\u0435\u0446\u0438\u0430\u043b\u0438\u0437\u0430\u0446\u0438\u044f', choices=[('industrial', '\u041f\u0440\u043e\u043c\u044b\u0448\u043b\u0435\u043d\u043d\u043e\u0435 \u0441\u0442\u0440\u043e\u0438\u0442\u0435\u043b\u044c\u0441\u0442\u0432\u043e'), ('individual', '\u0427\u0430\u0441\u0442\u043d\u043e\u0435 \u0441\u0442\u0440\u043e\u0438\u0442\u0435\u043b\u044c\u0441\u0442\u0432\u043e'), ('all', '\u0412\u0441\u0435')]),
            preserve_default=True,
        ),
    ]
