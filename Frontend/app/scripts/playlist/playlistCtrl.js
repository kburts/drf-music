'use strict';

angular
  .module('playlistApp')
  .controller('PlaylistCtrl', PlaylistCtrl);

angular
  .module('playlistApp')
  .controller('PlaylistListCtrl', PlaylistListCtrl);


function PlaylistCtrl (Playlist, YoutubePlayerService, Queue, $routeParams, $scope, $log) {
  $scope.playlist = Playlist.query({
    id: $routeParams.playlistId
  });

  $scope.playSong = function() {
    Queue.setQueue([this.song.name, this.song.yt_id]);
  };
  $scope.playAll = function() {
    var i, _i, _len, _ref;
    Queue.clearQueue();
    _ref = $scope.playlist.songs;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      i = _ref[_i];
      Queue.addToEndQueue([i.name, i.yt_id]);
    }
    $scope.queue = Queue.getQueue();
  };
  $scope.playShuffled = function() {
    $scope.playAll();
    Queue.shuffleQueue();
    $scope.queue = Queue.getQueue();
  };
};


function PlaylistListCtrl (PlaylistList, $scope) {
  // Uses the controller as syntax.
  var vm = this;
  vm.playlists = PlaylistList.query();
  //$scope.playlists = PlaylistList.query();
};