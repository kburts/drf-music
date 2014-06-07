'use strict'

app = angular.module 'playlistApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'api'
  ]

app.run ->
    ## Boilerplate code that I've seen in everyone's version of this app.
    ## Loads up the youtube API javascript as the first script on the doc
    tag = document.createElement('script');
    tag.src = "http://www.youtube.com/iframe_api";
    firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);


app.config ($routeProvider, $httpProvider) -> 
  ## ngRoute URLS
  $routeProvider
    .when '/yo',
      templateUrl: 'scripts/main/main.html'
      controller: 'MainCtrl'
    .when '/',
      templateUrl: 'scripts/playlist/PlaylistListView.html'
      controller: 'PlaylistListCtrl'
    .when '/play',
      templateUrl: 'scripts/playlist/PlaylistListView.html'
      controller: 'PlaylistListCtrl'
    .when '/play/create',
      templateUrl:'scripts/playlist/PlaylistFormView.html'
      controller: 'PlaylistFormCtrl'
    .when '/play/:playlistId',
      templateUrl: 'scripts/playlist/PlaylistView.html'
      controller: 'PlaylistCtrl'
    .when '/songs',
      templateUrl: 'scripts/song/SongListView.html'
      controller: 'SongListCtrl'
    .when '/songs/create',
      templateUrl: 'scripts/song/SongFormView.html'
      controller: 'SongFormCtrl'
    .when '/auth',
      templateUrl: 'scripts/auth/AuthView.html'
      controller: 'AuthCtrl'
    .otherwise
      redirectTo: '/'



    # use the HTML5 History API
    # $locationProvider.html5Mode(true);

    return