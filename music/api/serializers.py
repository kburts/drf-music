from django.contrib.auth.models import User

from rest_framework import serializers

from .models import Song, Playlist


class UserSerializer(serializers.ModelSerializer):
    playlists = serializers.HyperlinkedRelatedField(many=True, view_name='playlist-detail')

    class Meta:
        model = User
        fields = ('username', 'playlists')

class SongSerializer(serializers.ModelSerializer):
    playlist = serializers.PrimaryKeyRelatedField(many=True)
    class Meta:
        model = Song
        fields = ('name', 'url', 'playlist', 'id')
        #field  removed because it's going to be a M2M field (1 song used in many playlists)


class PlaylistSerializer(serializers.ModelSerializer):
    #songs = SongSerializer()
    serializers.PrimaryKeyRelatedField(many=True)

    user = serializers.Field(source='user.username')

    class Meta:
        model = Playlist
        fields = ('title', 'user', 'songs', 'id')


