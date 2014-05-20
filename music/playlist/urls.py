from django.conf.urls import patterns, url
from rest_framework.urlpatterns import format_suffix_patterns

import views

urlpatterns = patterns('',
    url(r'^playlist/$', views.PlaylistList.as_view()),
    url(r'^playlist/(?P<pk>[0-9]+)/$', views.PlaylistDetail.as_view()),

    url(r'^song/$', views.SongList.as_view()),
    url(r'^song/(?P<pk>[0-9]+)/$', views.SongDetail.as_view()),
)

urlpatterns = format_suffix_patterns(urlpatterns)