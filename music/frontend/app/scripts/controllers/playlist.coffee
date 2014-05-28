'use strict'

app = angular.module('playlistApp')

app.controller 'PlaylistCtrl', ['Playlist', 'YoutubePlayerService', 'Queue', '$scope', '$http', '$log', (Playlist, YoutubePlayerService, Queue, $scope, $http, $log) ->
    #Init
    $scope.hello = "hello!"
    $scope.songs = Playlist.query(id: 1)

    $scope.youtube = YoutubePlayerService.getYoutube();
    $scope.currentsong = ''

    $scope.launch = ->
        YoutubePlayerService.launchPlayer('0vyuFj__YOs', "Elaina's Theme")

    $scope.playSong = ->
        Queue.setQueue(this.song.name)
        $scope.currentsong = Queue.getQueue()
        $scope.currentsong.id = this.song.url

        YoutubePlayerService.launchPlayer(this.song.yt_id, this.song.name)
]