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
  /*
  $scope.currentsong = {};
  $scope.queue = [];
  $scope.$on('event', function(event, data) {
    if (data === 'ended') {
      return $scope.playNext();
    }
  });

  $scope.launch = function() {
    $log.log('Launched PlaylistCtrl!!');
    YoutubePlayerService.launchPlayer('0vyuFj__YOs', "Elaina's Theme");
    return $scope.youtube = YoutubePlayerService.getYoutube();
  };
  */
  $scope.playSong = function() {
    Queue.clearQueue();
    Queue.setQueue([this.song.name, this.song.yt_id]);
    $scope.play();
  };
  $scope.play = function() {
    $log.log("Queue set to:" + $scope.queue[0][0] + $scope.queue[0][1]);
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