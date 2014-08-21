'use strict';

angular
  .module('playlistApp')
  .controller('PlayerCtrl', PlayerCtrl);


function PlayerCtrl (Playlist, YoutubePlayerService, Queue, $routeParams, $scope, $log) {
  var vm = this;
  vm.queue = [];
  var updateQueue = function() {
    vm.queue = Queue.queue;
  }
  Queue.registerObserverCallback(updateQueue);
  vm.currentSong = {};
  //$scope.queue = [];
  $scope.$on('event', function(event, data) {
    if (data === 'ended') {
      vm.playNext();
    } else if (data === 'paused') {
      vm.pause();
    }
  });

  vm.play = function() {
    if (YoutubePlayerService.getYoutube().state == 'paused') {
      YoutubePlayerService.resumePlayer();
    }
    else {
      YoutubePlayerService.launchPlayer(vm.queue[0][1], vm.queue[0][0]);
      vm.currentSong = vm.queue[0][0]
    }
  };

  vm.playNext = function() {
    if (vm.queue.length <= 2) {
      $log.log("Playlist done!");
    } else {
      Queue.shiftQueue();
      vm.play();
    }
  };

  vm.pause = function() {
    YoutubePlayerService.pausePlayer();
  }
};

/*
PlayerCtrl.prototype.launch = function() {
  YoutubePlayerService.launchPlayer('0vyuFj__YOs', "Elaina's Theme");
  return vm.youtube = YoutubePlayerService.getYoutube();  
};

PlayerCtrl.prototype.playSong = function($log) {
  $log.log('playing a song playerCtrl');
  //YoutubePlayerService.launchPlayer(vm.queue[1], vm.queue[0]);
};
*/