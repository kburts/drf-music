# encoding: utf8
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0003_auto_20140530_1502'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='song',
            name='todel',
        ),
        migrations.RemoveField(
            model_name='playlist',
            name='todel',
        ),
    ]
