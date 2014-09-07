# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0004_auto_20140530_1506'),
    ]

    operations = [
        migrations.AlterField(
            model_name='playlist',
            name='user',
            field=models.ForeignKey(related_name=b'playlists', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='song',
            name='added_by',
            field=models.ForeignKey(related_name=b'songs', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='song',
            name='playlist',
            field=models.ForeignKey(related_name=b'songs', to='api.Playlist'),
        ),
    ]
