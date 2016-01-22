# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0045_auto_20160118_0927'),
    ]

    operations = [
        migrations.CreateModel(
            name='SellingProduct',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('price', models.BigIntegerField(verbose_name='\u0426\u0435\u043d\u0430 \u0442\u043e\u0432\u0430\u0440\u0430(\u0431\u0435\u043b. \u0440\u0443\u0431.)')),
            ],
            options={
                'verbose_name': '\u041f\u0440\u043e\u0434\u0430\u0432\u0430\u0435\u043c\u044b\u0439 \u043e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u0435\u0439 \u0442\u043e\u0432\u0430\u0440',
                'verbose_name_plural': '\u041f\u0440\u043e\u0434\u0430\u0432\u0430\u0435\u043c\u044b\u0435 \u043e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u044f\u043c\u0438 \u0442\u043e\u0432\u0430\u0440\u044b',
            },
        ),
        migrations.RemoveField(
            model_name='customerprofile',
            name='account',
        ),
        migrations.RemoveField(
            model_name='sellerprofile',
            name='account',
        ),
        migrations.AddField(
            model_name='organizationprofile',
            name='is_job_executor',
            field=models.BooleanField(default=False, verbose_name='\u041f\u0440\u043e\u0438\u0437\u0432\u043e\u0434\u0438\u0442\u0435\u043b\u044c \u0440\u0430\u0431\u043e\u0442'),
        ),
        migrations.AddField(
            model_name='organizationprofile',
            name='is_seller',
            field=models.BooleanField(default=False, verbose_name='\u041f\u0440\u043e\u0434\u0430\u0432\u0435\u0446 \u0442\u043e\u0432\u0430\u0440\u043e\u0432'),
        ),
        migrations.DeleteModel(
            name='CustomerProfile',
        ),
        migrations.DeleteModel(
            name='SellerProfile',
        ),
        migrations.AddField(
            model_name='sellingproduct',
            name='org',
            field=models.ForeignKey(verbose_name='\u041e\u0440\u0433\u0430\u043d\u0438\u0437\u0430\u0446\u0438\u044f, \u043f\u0440\u043e\u0434\u0430\u044e\u0449\u0430\u044f \u0442\u043e\u0432\u0430\u0440', to='remont.OrganizationProfile'),
        ),
        migrations.AddField(
            model_name='sellingproduct',
            name='product',
            field=models.ForeignKey(verbose_name='\u0422\u043e\u0432\u0430\u0440', to='remont.Product'),
        ),
    ]
