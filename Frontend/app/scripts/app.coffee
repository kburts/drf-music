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
  $routeProvider
    .when '/yo',
      templateUrl: 'views/main.html'
      controller: 'MainCtrl'
    .when '/',
      templateUrl: 'views/PlaylistListView.html'
      controller: 'PlaylistListCtrl'
    .when '/play',
      templateUrl: 'views/PlaylistListView.html'
      controller: 'PlaylistListCtrl'
    .when '/play/:playlistId',
      templateUrl: '/views/PlaylistView.html'
      controller: 'PlaylistCtrl'
    .when '/songs',
      templateUrl: 'views/SongListView.html'
      controller: 'SongListCtrl'
    .when '/auth',
      templateUrl: 'views/AuthView.html'
      controller: 'AuthCtrl'
    .otherwise
      redirectTo: '/'

    # use the HTML5 History API
    # $locationProvider.html5Mode(true);

    return