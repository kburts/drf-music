'use strict'

app = angular.module 'playlistApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'api'
  ]


app.config ($routeProvider, $locationProvider) ->
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
    .otherwise
      redirectTo: '/play/1'

    # use the HTML5 History API
    # $locationProvider.html5Mode(true);
