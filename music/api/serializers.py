from django.contrib.auth.models import User

from rest_framework import serializers

from .models import Song, Playlist


class SongSerializer(serializers.ModelSerializer):
    playlist = serializers.PrimaryKeyRelatedField(many=True)
    added_by = serializers.Field(source='added_by.username')

    class Meta:
        model = Song
        # Artist can be added later if needbe
        fields = ('name', 'url', 'playlist', 'added_by', 'meta_name', 'meta_artist', 'meta_genre', 'id')


class SongSerializerSimple(serializers.ModelSerializer):
    """
    Dumbed down version of SongSerializer to return only Name and URL
    For use in views which need to be smaller than the whole SongSerializer
    """
    yt_id = serializers.Field(source='get_youtube_id') #Youtube ID to be used in the embedded player for song lookup
    class Meta:
        model = Song
        fields = ('name', 'url', 'meta_name', 'meta_artist', 'meta_genre', 'yt_id')
        read_only_fields = ('name', 'url', 'yt_id')


class PlaylistSerializer(serializers.ModelSerializer):
    # Primany key related field for quick editing of songs in playlist
    songs = SongSerializerSimple(required=False)
    addSongs = serializers.PrimaryKeyRelatedField('songs', many=True)

    user = serializers.Field(source='user.username')

    class Meta:
        model = Playlist
        fields = ('title', 'user', 'created', 'modified', 'songs', 'addSongs', 'public_edit', 'id')


class UserSerializer(serializers.ModelSerializer):
    playlists = serializers.HyperlinkedRelatedField(many=True, view_name='playlist-detail')
    songs = SongSerializerSimple()

    class Meta:
        model = User
        fields = ('username', 'playlists', 'songs')