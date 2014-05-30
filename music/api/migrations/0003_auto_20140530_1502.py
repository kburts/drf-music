# encoding: utf8
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_song'),
    ]

    operations = [
        migrations.AddField(
            model_name='song',
            name='todel',
            field=models.CharField(default='', max_length=200),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='playlist',
            name='todel',
            field=models.CharField(default='', max_length=200),
            preserve_default=False,
        ),
    ]
