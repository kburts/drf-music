import datetime

from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Playlist(models.Model):
    title = models.CharField(max_length=200)
    created = models.DateTimeField(editable=False)
    modified = models.DateTimeField()
    user = models.ForeignKey(User)

    def __unicode__(self):
        return self.title

    def save(self, *args, **kwargs):
        ''' On save, update timestamps '''
        # http://stackoverflow.com/questions/1737017/django-auto-now-and-auto-now-add
        if not self.id:
            self.created = datetime.datetime.today()
        self.modified = datetime.datetime.today()
        return super(User, self).save(*args, **kwargs)

class Song(models.Model):
    playlist = models.ForeignKey(Playlist)

    name = models.CharField(max_length=200)
    artist = models.CharField(max_length=200)
    url = models.URLField(max_length=200)

    added_by = models.ForeignKey(User)

    def __unicode__(self):
        return self.name