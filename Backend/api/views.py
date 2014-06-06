from django.contrib.auth.models import User

from rest_framework import generics
from rest_framework import viewsets
from rest_framework import permissions
from rest_framework import exceptions
from rest_framework.decorators import api_view
from rest_framework.response import Response


from .models import Playlist, Song
from .serializers import PlaylistSerializer, SongSerializer, UserSerializer, UserCreateSerializer
from .permissions import IsOwnerOrReadOnly, IsOwnerOrAdminOrReadOnlySong

### PLAYLISTS ###
class PlaylistList(generics.ListCreateAPIView):
    queryset = Playlist.objects.all()
    serializer_class = PlaylistSerializer

    def pre_save(self, obj):
        obj.user = self.request.user


class PlaylistDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Playlist.objects.all()
    serializer_class = PlaylistSerializer


### SONGS ###
class SongList(generics.ListCreateAPIView):
    queryset = Song.objects.all()
    serializer_class = SongSerializer

    def pre_save(self, obj):
        obj.added_by = self.request.user


class SongDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Song.objects.all()
    serializer_class = SongSerializer
    permission_classes = (IsOwnerOrAdminOrReadOnlySong,)


### USERS ###
class UserList(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    #permission_classes = (permissions.IsAdminUser,)
    paginate_by = 100

class UserCreate(generics.CreateAPIView):
    model = User
    permission_classes = (permissions.AllowAny,)
    serializer_class = UserCreateSerializer


class UserDetail(generics.RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    #permission_classes = (permissions.IsAdminUser,)
    lookup_field = 'username'


@api_view(['GET'])
def CurrentUser(request):
    user = request.user
    if user.is_authenticated():
        return Response({
            'username': user.username
        })
    else:
        raise exceptions.PermissionDenied