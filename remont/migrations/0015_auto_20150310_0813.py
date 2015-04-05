# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


def update_work_spec(apps, schema_editor):
	OrganizationProfile = apps.get_model('remont', 'OrganizationProfile')
	WorkSpec = apps.get_model('remont', 'WorkSpec')
	for profile in OrganizationProfile.objects.all():		
		workSpec = WorkSpec.objects.filter(name=profile.type).first()
		if workSpec:
			profile.spec.add(workSpec)
			profile.save()


class Migration(migrations.Migration):

    dependencies = [
        ('remont', '0014_auto_20150310_0759'),
    ]

    operations = [
    	migrations.RunPython(update_work_spec)
    ]
