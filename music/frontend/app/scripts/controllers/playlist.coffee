'use strict'

app = angular.module('playlistApp')

app.controller 'PlaylistCtrl', ['Playlist', 'YoutubePlayerService', 'Queue', '$routeParams', '$scope', '$log', (Playlist, YoutubePlayerService, Queue, $routeParams, $scope, $log) ->
    #Init
    $scope.hello = 'hello'
    $scope.songs = Playlist.query(id: $routeParams.playlistId)
    $scope.currentsong = {}

    $scope.launch = ->
        YoutubePlayerService.launchPlayer('0vyuFj__YOs', "Elaina's Theme")
        $scope.youtube = YoutubePlayerService.getYoutube();

    $scope.playSong = ->
        Queue.setQueue([this.song.name, this.song.yt_id])
        $scope.currentsong.name = Queue.getQueue()[0]
        $scope.currentsong.id = Queue.getQueue()[1]
        console.log(Queue.getQueue())

        YoutubePlayerService.launchPlayer($scope.currentsong.id, $scope.currentsong.name)
        return

    $scope.playAll = ->
        for i in $scope.songs.songs
            Queue.addToEndQueue([i.name, i.yt_id])

        Queue.getQueue()
        #console.log(Queue.getQueue())
        return

    $scope.shufflePlaylist = ->
        Queue.shuffleQueue()
        #console.log(Queue.getQueue())
        return
]



app.controller 'PlaylistListCtrl', ['PlaylistList', '$scope', (PlaylistList, $scope) ->
    $scope.playlists = PlaylistList.query()
]