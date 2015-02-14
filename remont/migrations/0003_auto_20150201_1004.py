# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='jobsuggestion',
            name='contact_name',
            field=models.CharField(default=b'', max_length=100, verbose_name='\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u043d\u043e\u0435 \u043b\u0438\u0446\u043e'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='jobsuggestion',
            name='job_type',
            field=models.ForeignKey(default=b'', verbose_name='\u0412\u0438\u0434 \u0440\u0430\u0431\u043e\u0442', to='remont.WorkType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='jobsuggestion',
            name='short_header',
            field=models.CharField(default=b'', help_text='\u041a\u0440\u0430\u0442\u043a\u0438\u0439 \u0437\u0430\u0433\u043e\u043b\u043e\u0432\u043e\u043a \u0437\u0430\u044f\u0432\u043a\u0438', max_length=50, verbose_name='\u041a\u0440\u0430\u0442\u043a\u0438\u0439 \u0437\u0430\u0433\u043e\u043b\u043e\u0432\u043e\u043a \u0437\u0430\u044f\u0432\u043a\u0438'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='jobsuggestion',
            name='date_created',
            field=models.DateTimeField(auto_now_add=True, verbose_name='\u0414\u0430\u0442\u0430 \u0441\u043e\u0437\u0434\u0430\u043d\u0438\u044f'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='jobsuggestion',
            name='description',
            field=models.TextField(default=b'', verbose_name='\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435 \u0440\u0430\u0431\u043e\u0442\u044b'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='jobsuggestion',
            name='email',
            field=models.EmailField(default=b'', max_length=75, verbose_name='\u042d\u043b\u0435\u043a\u0442\u0440\u043e\u043d\u043d\u0430\u044f \u043f\u043e\u0447\u0442\u0430'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='jobsuggestion',
            name='phone',
            field=models.CharField(default=b'', max_length=25, verbose_name='\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u043d\u044b\u0439 \u0442\u0435\u043b\u0435\u0444\u043e\u043d'),
            preserve_default=True,
        ),
    ]
