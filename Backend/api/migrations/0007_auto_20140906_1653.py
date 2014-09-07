# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0006_auto_20140906_1653'),
    ]

    operations = [
        migrations.AlterField(
            model_name='song',
            name='playlist',
            field=models.ForeignKey(related_name=b'songs', to='api.Playlist'),
        ),
    ]
