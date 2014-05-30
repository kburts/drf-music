# encoding: utf8
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Song',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('url', models.URLField()),
                ('meta_name', models.CharField(max_length=200, blank=True)),
                ('meta_artist', models.CharField(max_length=200, blank=True)),
                ('meta_genre', models.CharField(max_length=200, blank=True)),
                ('added_by', models.ForeignKey(to=settings.AUTH_USER_MODEL, to_field='id')),
                ('playlist', models.ManyToManyField(to='api.Playlist')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
