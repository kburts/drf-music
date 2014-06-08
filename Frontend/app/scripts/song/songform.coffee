'use strict'

app = angular.module 'playlistApp'

app.controller 'SongFormCtrl', ['$scope', 'User', ($scope, User) ->
    $scope.playlists = User.query(id: 'kevin')
    #console.log($scope.playlists)
]