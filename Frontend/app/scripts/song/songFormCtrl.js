'use strict';

angular
  .module('playlistApp')
  .controller('SongFormCtrl', SongFormCtrl);

function SongFormCtrl ($scope, $log, $window, User, Playlist) {
  $scope.currentuser = User.query({
    username: $window.sessionStorage.username
  });
  $scope.songsToAdd = [];
  $scope.songsToRemove = [];
  $scope.getPlaylistSongs = function(playlist) {
    var playlistId, _i, _len, _playlist, _ref;
    _ref = $scope.currentuser.playlists;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      _playlist = _ref[_i];
      if (_playlist.title === playlist) {
        playlistId = _playlist.id;
      }
    }
    return $scope.songs = Playlist.query({
      id: playlistId
    });
  };
  $scope.addToList = function(url, name) {
    var canAdd, _i, _len, _ref, _song;
    canAdd = true;
    _ref = $scope.songsToAdd;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      _song = _ref[_i];
      if (url === _song.url) {
        canAdd = false;
        break;
      } else {

      }
    }
    if (canAdd === true) {
      $scope.songsToAdd.push({
        url: url,
        name: name
      });
      return $log.log($scope.songsToAdd);
    }
  };
  return $scope.updatePlaylist = function() {};
};