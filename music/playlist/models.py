from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

# Create your models here.

class Playlist(models.Model):
    title = models.CharField(max_length=200)
    creation_date = models.DateTimeField('date created', default=timezone.now())
    user = models.ForeignKey(User)

    def __unicode__(self):
        return self.title


class Song(models.Model):
    name = models.CharField(max_length=200)
    artist = models.CharField(max_length=200)
    playlist = models.ForeignKey(Playlist)
    url = models.URLField(max_length=200)

    def __unicode__(self):
        return self.name