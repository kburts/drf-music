'use strict';

angular
  .module('playlistApp')
  .controller('PlaylistCtrl', PlaylistCtrl);

angular
  .module('playlistApp')
  .controller('PlaylistListCtrl', PlaylistListCtrl);


function PlaylistCtrl (Playlist, YoutubePlayerService, Queue, $routeParams, $scope, $log) {
  $scope.hello = 'hello';
  $scope.playlist = Playlist.query({
    id: $routeParams.playlistId
  });
  $scope.currentsong = {};
  $scope.queue = [];
  $scope.$on('event', function(event, data) {
    if (data === 'ended') {
      return $scope.playNext();
    }
  });
  $scope.launch = function() {
    YoutubePlayerService.launchPlayer('0vyuFj__YOs', "Elaina's Theme");
    return $scope.youtube = YoutubePlayerService.getYoutube();
  };
  $scope.playSong = function() {
    Queue.clearQueue();
    Queue.addToEndQueue([this.song.name, this.song.yt_id]);
    Queue.setQueue([this.song.name, this.song.yt_id]);
    $scope.queue = Queue.getQueue();
    $log.log(Queue.getQueue());
    $scope.play();
  };
  $scope.play = function() {
    if (typeof $scope.queue[0] === 'object') {
      $log.log("Playing a song" + $scope.queue[0][0] + $scope.queue[0][1]);
      YoutubePlayerService.launchPlayer($scope.queue[0][1], $scope.queue[0][0]);
      return $log.log("Playing song from array queue");
    } else if (typeof $scope.queue[0] === 'string') {
      $log.log("Playing a song" + $scope.queue[0] + $scope.queue[1]);
      YoutubePlayerService.launchPlayer($scope.queue[1], $scope.queue[0]);
      return $log.log("Playing song from single song queue");
    }
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
    $log.log($scope.queue);
    $scope.play();
  };
  $scope.playShuffled = function() {
    var i, _i, _len, _ref;
    Queue.clearQueue();
    _ref = $scope.playlist.songs;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      i = _ref[_i];
      Queue.addToEndQueue([i.name, i.yt_id]);
    }
    Queue.shuffleQueue();
    $scope.queue = Queue.getQueue();
    $log.log($scope.queue);
    $scope.play();
  };
  $scope.playNext = function() {
    if ($scope.queue.length <= 2) {
      $log.log("Playlist done!");
    } else {
      Queue = $scope.queue.shift();
      $scope.play();
    }
  };
};


function PlaylistListCtrl (PlaylistList, $scope) {
  var vm = this;
  vm.playlists = PlaylistList.query();
  //$scope.playlists = PlaylistList.query();
};