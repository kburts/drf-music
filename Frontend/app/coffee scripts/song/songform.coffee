'use strict'

app = angular.module 'playlistApp'

app.controller 'SongFormCtrl', ['$scope', '$log', '$window', 'User', 'Playlist', ($scope, $log, $window, User, Playlist) ->
    $scope.currentuser = User.query(username: $window.sessionStorage.username)
    $scope.songsToAdd = []
    $scope.songsToRemove = []

    $scope.getPlaylistSongs = (playlist) ->
        for _playlist in $scope.currentuser.playlists
            ## Quickly get the ID of the selected playlist
            if _playlist.title is playlist
                playlistId = _playlist.id
        $scope.songs = Playlist.query(id: playlistId)

    $scope.addToList = (url, name) ->
        ## Validation url should not be in list already and should have youtube.com in it
        canAdd = true
        for _song in $scope.songsToAdd
            if url is _song.url
                canAdd = false
                break
            else
        if canAdd is true
            $scope.songsToAdd.push({url: url, name: name})
            $log.log($scope.songsToAdd)

    $scope.updatePlaylist = ->
        
]