from django.conf.urls import patterns, url, include
from rest_framework.urlpatterns import format_suffix_patterns
from .views import PlaylistList, PlaylistDetail
from .views import SongList, SongDetail
from .views import CreatePlaylistFromYoutube
from .views import UserList, UserCreate, UserDetail, CurrentUser

user_urls = patterns('',
    url(r'^/$', UserList.as_view(), name='user-list'),
    url(r'^/register/$', UserCreate.as_view(), name='user-register'),
    url(r'^/me/$', CurrentUser, name='user-loggedin'),
    url(r'^/(?P<username>[0-9a-zA-Z_-]+)/$', UserDetail.as_view(), name='user-detail'),
)

playlist_urls = patterns('',
    url(r'^/$', PlaylistList.as_view(), name='playlist-list'),
    url(r'^/(?P<pk>[0-9]+)/$', PlaylistDetail.as_view(), name='playlist-detail'),
)

song_urls = patterns('',
    url(r'^/$', SongList.as_view(), name='song-list'),
    url(r'^/(?P<pk>[0-9]+)/$', SongDetail.as_view(), name='song-detail'),
)

youtube_urls = patterns('',
    url(r'^/create/$', CreatePlaylistFromYoutube.as_view(), name='create-from-youtube'),
)

urlpatterns = patterns('',
    url(r'users', include(user_urls)),
    url(r'playlist', include(playlist_urls)),
    url(r'song', include(song_urls)),
    url(r'youtube', include(youtube_urls)),
)

urlpatterns = format_suffix_patterns(urlpatterns)