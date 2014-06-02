'use strict'

app = angular.module('playlistApp')

app.controller 'PlaylistCtrl', ['Playlist', 'YoutubePlayerService', 'Queue', '$routeParams', '$scope', '$log', (Playlist, YoutubePlayerService, Queue, $routeParams, $scope, $log) ->
    #Init
    $scope.hello = 'hello'
    $scope.songs = Playlist.query(id: $routeParams.playlistId)
    
    $scope.currentsong = {}
    $scope.queue = []

    ## Check to see if the song ended. If it did, play the next song
    $scope.$on('event', (event, data) -> 
        if data is 'ended'
            $scope.playNext()
        )

    $scope.launch = ->
        YoutubePlayerService.launchPlayer('0vyuFj__YOs', "Elaina's Theme")
        $scope.youtube = YoutubePlayerService.getYoutube();

    $scope.playSong = ->
        Queue.clearQueue()
        Queue.addToEndQueue([this.song.name, this.song.yt_id])
        Queue.setQueue([this.song.name, this.song.yt_id])
        #$scope.currentsong.name = Queue.getQueue()[0]
        #$scope.currentsong.id = Queue.getQueue()[1]
        $scope.queue = Queue.getQueue()
        $log.log(Queue.getQueue())

        $scope.play()
        return

    $scope.play = ->
        if typeof $scope.queue[0] is 'object'
            $log.log("Playing a song" + $scope.queue[0][0] + $scope.queue[0][1])
            YoutubePlayerService.launchPlayer($scope.queue[0][1], $scope.queue[0][0])
            $log.log("Playing song from array queue")
        # for playing a single song with the playSong function.
        else if typeof $scope.queue[0] is 'string'
            $log.log("Playing a song" + $scope.queue[0] + $scope.queue[1])
            YoutubePlayerService.launchPlayer($scope.queue[1], $scope.queue[0])
            $log.log("Playing song from single song queue")

    $scope.playAll = ->
        Queue.clearQueue()
        for i in $scope.songs.songs
            Queue.addToEndQueue([i.name, i.yt_id])

        $scope.queue = Queue.getQueue()
        $log.log($scope.queue)
        $scope.play()
        return

    $scope.playShuffled = ->
        Queue.clearQueue()
        for i in $scope.songs.songs
            Queue.addToEndQueue([i.name, i.yt_id])

        Queue.shuffleQueue()
        $scope.queue = Queue.getQueue()
        $log.log($scope.queue)
        $scope.play()
        return

    $scope.playNext = ->
        if $scope.queue.length <= 2
            $log.log("Playlist done!")
            return
        else
            Queue = $scope.queue.shift()
            $scope.play()
            return
    return
]


app.controller 'PlaylistListCtrl', ['PlaylistList', '$scope', (PlaylistList, $scope) ->
    $scope.playlists = PlaylistList.query()
]