'use strict';
var app;

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


function config($routeProvider, $httpProvider) {
  $routeProvider.when('/yo', {
    templateUrl: 'scripts/main/main.html',
    controller: 'MainCtrl'
  }).when('/', {
    templateUrl: 'scripts/playlist/PlaylistListView.html',
    controller: 'PlaylistListCtrl'
  }).when('/play', {
    templateUrl: 'scripts/playlist/PlaylistListView.html',
    controller: 'PlaylistListCtrl'
  }).when('/play/create', {
    templateUrl: 'scripts/playlist/PlaylistFormView.html',
    controller: 'PlaylistFormCtrl'
  }).when('/play/:playlistId', {
    templateUrl: 'scripts/playlist/PlaylistView.html',
    controller: 'PlaylistCtrl'
  }).when('/songs', {
    templateUrl: 'scripts/song/SongListView.html',
    controller: 'SongListCtrl'
  }).when('/songs/create', {
    templateUrl: 'scripts/song/SongFormView.html',
    controller: 'SongFormCtrl'
  }).when('/auth', {
    templateUrl: 'scripts/auth/AuthView.html',
    controller: 'AuthCtrl'
  }).otherwise({
    redirectTo: '/'
  });
};

