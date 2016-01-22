# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import remont.models


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0044_partnerrequest'),
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200, verbose_name='\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435 \u0442\u043e\u0432\u0430\u0440\u0430')),
                ('description', models.CharField(max_length=500, null=True, verbose_name='\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435 \u0442\u043e\u0432\u0430\u0440\u0430', blank=True)),
                ('price', models.BigIntegerField(verbose_name='\u0426\u0435\u043d\u0430 \u0442\u043e\u0432\u0430\u0440\u0430(\u0431\u0435\u043b. \u0440\u0443\u0431.)')),
                ('image', models.ImageField(default=None, upload_to=remont.models.save_product_image, verbose_name='\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435', blank=True)),
            ],
            options={
                'verbose_name': '\u0422\u043e\u0432\u0430\u0440',
                'verbose_name_plural': '\u0422\u043e\u0432\u0430\u0440\u044b',
            },
        ),
        migrations.CreateModel(
            name='ProductCategory',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name='\u041d\u0430\u0438\u043c\u0435\u043d\u043e\u0432\u0430\u043d\u0438\u0435 \u043a\u0430\u0442\u0435\u0433\u043e\u0440\u0438\u0438')),
            ],
            options={
                'verbose_name': '\u041a\u0430\u0442\u0435\u0433\u043e\u0440\u0438\u044f \u0442\u043e\u0432\u0430\u0440\u043e\u0432',
                'verbose_name_plural': '\u041a\u0430\u0442\u0435\u0433\u043e\u0440\u0438\u0438 \u0442\u043e\u0432\u0430\u0440\u043e\u0432',
            },
        ),
        migrations.CreateModel(
            name='ProductType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name='\u0412\u0438\u0434 \u0442\u043e\u0432\u0430\u0440\u0430')),
                ('logo', models.ImageField(default=None, upload_to=remont.models.save_product_image, verbose_name='\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435', blank=True)),
                ('category', models.ForeignKey(verbose_name='\u041a\u0430\u0442\u0435\u0433\u043e\u0440\u0438\u044f \u0442\u043e\u0432\u0430\u0440\u0430', to='remont.ProductCategory')),
            ],
            options={
                'verbose_name': '\u0412\u0438\u0434 \u0442\u043e\u0432\u0430\u0440\u0430',
                'verbose_name_plural': '\u0412\u0438\u0434\u044b \u0442\u043e\u0432\u0430\u0440\u043e\u0432',
            },
        ),
        migrations.AddField(
            model_name='product',
            name='ptype',
            field=models.ForeignKey(verbose_name='\u0412\u0438\u0434 \u0442\u043e\u0432\u0430\u0440\u0430', to='remont.ProductType'),
        ),
    ]
