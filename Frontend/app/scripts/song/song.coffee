'use strict'

app = angular.module('playlistApp')

app.controller 'SongListCtrl', ['SongList', '$scope', (SongList, $scope) ->
    $scope.songs = SongList.query()
]