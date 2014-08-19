'use strict';

angular
  .module('playlistApp')
  .service('YoutubePlayerService', YoutubePlayerService);


function YoutubePlayerService(Queue, $window, $rootScope, $log) {
  var events, onYoutubeReady, onYoutubeStateChange, queue, service, youtube;
  service = this;
  queue = [];
  events = "";
  youtube = {
    ready: false,
    player: null,
    playerId: null,
    videoId: null,
    videoTitle: null,
    playerHeight: '480',
    playerWidth: '640',
    state: 'stopped'
  };
  $window.onYouTubeIframeAPIReady = function() {
    $log.info('Youtube API is ready');
    youtube.ready = true;
    service.bindPlayer('placeholder');
    service.loadPlayer();
    return $rootScope.$apply();
  };
  onYoutubeReady = function(event) {
    $log.info("YouTube Player is ready");
    youtube.player.cueVideoById('0vyuFj__YOs');
    youtube.videoId = '0vyuFj__YOs';
    return youtube.videoTitle = "Elaina's Theme";
  };
  onYoutubeStateChange = function(event) {
    if (event.data === YT.PlayerState.PLAYING) {
      $log.info("State: Playing!");
      youtube.state = 'playing';
      $rootScope.$broadcast('event', youtube.state);
    }
    if (event.data === YT.PlayerState.ENDED) {
      youtube.state = 'ended';
      $log.info("Song ended, going to next one!");
      $rootScope.$broadcast('event', youtube.state);
    }
    $rootScope.$apply();
  };
  this.bindPlayer = function(elementId) {
    $log.info("Binding to " + elementId);
    return youtube.playerId = elementId;
  };
  this.createPlayer = function() {
    $log.info("Creating a new Youtube player for DOM id " + youtube.playerId + " and video " + youtube.videoId);
    return new YT.Player(youtube.playerId, {
      height: youtube.playerHeight,
      width: youtube.playerWidth,
      playerVars: {
        rel: 0,
        showinfo: 0
      },
      events: {
        onReady: onYoutubeReady,
        onStateChange: onYoutubeStateChange
      }
    });
  };
  this.loadPlayer = function() {
    if (youtube.ready && youtube.playerId) {
      if (youtube.player) {
        youtube.player.destroy();
      }
      return youtube.player = service.createPlayer();
    }
  };
  this.launchPlayer = function(id, title) {
    youtube.player.loadVideoById(id);
    youtube.videoId = id;
    youtube.videoTitle = title;
    return youtube;
  };
  this.getYoutube = function() {
    return youtube;
  };
};
