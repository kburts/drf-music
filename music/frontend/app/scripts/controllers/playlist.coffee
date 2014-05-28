'use strict'

app = angular.module('playlistApp')

app.controller 'PlaylistCtrl', ['Playlist', 'YoutubePlayerService', 'Queue', '$scope', '$http', '$log', (Playlist, YoutubePlayerService, Queue, $scope, $http, $log) ->
    #Init
    $scope.hello = "hello!"
    $scope.songs = Playlist.query(id: 1)

    $scope.youtube = YoutubePlayerService.getYoutube();
    $scope.currentsong = ''

    $scope.launch = ->
        YoutubePlayerService.launchPlayer('pMkYn1SQSs4', "Good Eats - S09E10P01 - Great Balls O' Meat")

    $scope.playSong = ->
        Queue.setQueue(this.song.name)
        $scope.currentsong = Queue.getQueue()
        $scope.currentsong.id = this.song.url

        YoutubePlayerService.launchPlayer(this.song.yt_id, this.song.name)
]