'use strict';

angular.module('playlistApp', ['ngCookies', 'ngResource', 'ngSanitize', 'ngRoute', 'api']);

angular
  .module('playlistApp')
  .run(run);

angular
  .module('playlistApp')
  .config(config)

function run() {
  var firstScriptTag, tag;
  tag = document.createElement('script');
  tag.src = "http://www.youtube.com/iframe_api";
  firstScriptTag = document.getElementsByTagName('script')[0];
  return firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
};


function config($routeProvider) {
  $routeProvider
  // Static URLs
  .when('/', {
    redirectTo: '/play'
  }).when('/about', {
    templateUrl: 'views/about.html'
  })
  // Playlist URLs
  .when('/play', {
    templateUrl: 'scripts/playlist/PlaylistListView.html',
    controllerAs: 'PlaylistList',
    controller: 'PlaylistListCtrl'
  }).when('/play/create', {
    templateUrl: 'scripts/playlist/PlaylistFormView.html',
    controller: 'PlaylistFormCtrl'
  }).when('/play/:playlistId', {
    templateUrl: 'scripts/playlist/PlaylistView.html',
    controller: 'PlaylistCtrl'
  })
  // Song URLs
  .when('/songs', {
    templateUrl: 'scripts/song/SongListView.html',
    controller: 'SongListCtrl'
  }).when('/songs/create', {
    templateUrl: 'scripts/song/SongFormView.html',
    controller: 'SongFormCtrl'
  })
  // Auth & misc API URLs
  .when('/auth', {
    templateUrl: 'scripts/auth/AuthView.html',
    controller: 'AuthCtrl'
  })
  // Otherwise
  .otherwise({
    redirectTo: '/'
  });
};

