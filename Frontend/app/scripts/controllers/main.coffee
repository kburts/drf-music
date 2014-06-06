'use strict'

app = angular.module 'playlistApp'

app.controller 'MainCtrl', ['$scope', '$window', 'Playlist',  ($scope, $window, Playlist) ->
    $scope.hello = "scope hellohello"
    $scope.awesomeThings = [
        'HTML5 Boilerplate'
        'AngularJS'
        'Karma'
    $scope.apicall = Playlist.query()
    ]
]