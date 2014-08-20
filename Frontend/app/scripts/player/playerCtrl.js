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
  vm.currentsong = {};
  //$scope.queue = [];
  $scope.$on('event', function(event, data) {
    if (data === 'ended') {
      $scope.playNext();
    }
  });

  /*
  vm.launch = function() {
    $log.log('Launched PlayerCtrl!!');
    YoutubePlayerService.launchPlayer('0vyuFj__YOs', "Elaina's Theme");
    return vm.youtube = YoutubePlayerService.getYoutube();
  };
  */
  vm.playSong = function() {
    $log.log('Playing song with playerCtrl');
    $log.log("Playing a song" + vm.queue[0][0] + vm.queue[0][1]);
    YoutubePlayerService.launchPlayer(vm.queue[0][1], vm.queue[0][0]);
  };

  vm.playNext = function() {
    if (vm.queue.length <= 2) {
      $log.log("Playlist done!");
    } else {
      Queue.shiftQueue();
      vm.playSong();
    }
  };
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