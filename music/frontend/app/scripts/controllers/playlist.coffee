'use strict'

app = angular.module('playlistApp')

app.controller 'PlaylistCtrl', ['Playlist', 'YoutubePlayerService', 'Queue', '$routeParams', '$scope', '$log', (Playlist, YoutubePlayerService, Queue, $routeParams, $scope, $log) ->
    #Init
    $scope.hello = 'hello'
    $scope.songs = Playlist.query(id: $routeParams.playlistId)

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

app.controller 'PlaylistListCtrl', ['PlaylistList', '$scope', (PlaylistList, $scope) ->
    $scope.playlists = PlaylistList.query()
]