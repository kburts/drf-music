'use strict'

app = angular.module 'playlistApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'api'
  ]


app.config ($routeProvider) ->
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
      templateUrl: 'views/PlaylistView.html'
      controller: 'PlaylistCtrl'
    .otherwise
      redirectTo: '/404'

