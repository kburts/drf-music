# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0005_auto_20140906_1648'),
    ]

    operations = [
        migrations.AlterField(
            model_name='song',
            name='playlist',
            field=models.ManyToManyField(related_name=b'songs', to=b'api.Playlist'),
        ),
    ]
