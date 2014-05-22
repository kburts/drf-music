from django.contrib.auth.models import User

from rest_framework import serializers

from .models import Song, Playlist


class SongSerializerSimple(serializers.ModelSerializer):
    """
    Dumbed down version of SongSerializer to return only Name and URL
    For use in views which need to be smaller than the whole SongSerializer
    """
    class Meta:
        model = Song
        fields = ('name', 'url')
        read_only_fields = ('name', 'url')


class UserSerializer(serializers.ModelSerializer):
    playlists = serializers.HyperlinkedRelatedField(many=True, view_name='playlist-detail')
    songs = SongSerializerSimple()

    class Meta:
        model = User
        #fields = ('username', 'playlists', 'songs')


class SongSerializer(serializers.ModelSerializer):
    playlist = serializers.PrimaryKeyRelatedField(many=True)
    added_by = serializers.Field(source='added_by.username')

    class Meta:
        model = Song
        fields = ('name', 'url', 'playlist', 'added_by', 'id')


class PlaylistSerializer(serializers.ModelSerializer):
    songs = SongSerializerSimple(required=False)
    # Primany key related field for quick editing of songs in playlist
    addSongs = serializers.PrimaryKeyRelatedField('songs', many=True)

    user = serializers.Field(source='user.username')

    class Meta:
        model = Playlist
        fields = ('title', 'user', 'created', 'modified', 'songs', 'addSongs', 'id')