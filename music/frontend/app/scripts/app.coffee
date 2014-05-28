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
    .when '/',
      templateUrl: 'views/main.html'
      controller: 'MainCtrl'
    .when '/play',
      templateUrl: 'views/PlaylistView.html'
      controller: 'PlaylistCtrl'
    .otherwise
      redirectTo: '/404'

