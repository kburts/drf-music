from django.conf.urls import patterns, url, include
from rest_framework.urlpatterns import format_suffix_patterns
import views


urlpatterns = patterns('',
    url(r'^playlist/$', views.PlaylistList.as_view()),
    url(r'^playlist/(?P<pk>[0-9]+)/$', views.PlaylistDetail.as_view()),

    url(r'^song/$', views.SongList.as_view()),
    url(r'^song/(?P<pk>[0-9]+)/$', views.SongDetail.as_view()),

    url(r'users/$', views.UserList.as_view()),
    url(r'^users/(?P<username>[a-zA-Z0-9@.+_-]+)/$', views.UserDetail.as_view()),
)

urlpatterns = format_suffix_patterns(urlpatterns)