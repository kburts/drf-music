import datetime
import urlparse


from django.db import models
from django.contrib.auth.models import User
# Create your models here.


class Playlist(models.Model):
    """
    Playlist model
    M2M to Song model
    """
    title = models.CharField(max_length=200)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)
    user = models.ForeignKey(User, related_name='playlists')
    description = models.CharField(max_length=250)
    public_edit = models.BooleanField(default=False)

    def __unicode__(self):
        return self.title


class Song(models.Model):
    """
    Song model
    M2M to Playlist Model
    """
    playlist = models.ManyToManyField(Playlist, related_name='songs')
    # Youtube stuff
    name = models.CharField(max_length=200)
    url = models.URLField(max_length=200)

    # User editable things (for searching etc...
    meta_name = models.CharField(max_length=200, blank=True)
    meta_artist = models.CharField(max_length=200, blank=True)
    meta_genre = models.CharField(max_length=200, blank=True)

    added_by = models.ForeignKey(User, related_name='songs')

    def __unicode__(self):
        return self.name

    def get_youtube_id(self):
        """
        Returns the 11 character lookup code for a youtube URL
        Ex. https://www.youtube.com/watch?v=coYqrXsDPdU >>> coYqrXsDPdU
        """
        return urlparse.urlparse(self.url).query[2:]
