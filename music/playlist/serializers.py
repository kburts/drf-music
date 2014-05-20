from django.contrib.auth.models import User

from rest_framework import serializers

from .models import Song, Playlist


class SongSerializer(serializers.ModelSerializer):

    class Meta:
        model = Song
        fields = ('name', 'playlist', 'url')


class PlaylistSerializer(serializers.ModelSerializer):
    songs = serializers.RelatedField(many=True)
    user = serializers.Field(source='user.username')

    class Meta:
        model = Playlist
        fields = ('title', 'user', 'songs', 'id')


#class UserSerializer(serializers.HyperlinkedModelSerializer):
# ^^ Change to this once user_detail is added
class UserSerializer(serializers.ModelSerializer):
    playlists = serializers.RelatedField(many=True)

    class Meta:
        model = User
        fields = ('username', 'playlists')