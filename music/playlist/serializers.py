from django.contrib.auth.models import User

from rest_framework import serializers

from .models import Song, Playlist


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('url', 'username', 'email', 'groups')

class SongSerializer(serializers.ModelSerializer):

    class Meta:
        model = Song
        fields = ('name', 'playlist', 'url')


class PlaylistSerializer(serializers.ModelSerializer):
    songs = SongSerializer(many=True)

    class Meta:
        model = Playlist
        fields = ('title', 'user', 'songs' 'id')