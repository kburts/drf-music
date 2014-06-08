'use strict'

app = angular.module 'playlistApp'

app.controller 'SongFormCtrl', ['$scope', 'User', 'Playlist', ($scope, User, Playlist) ->
    $scope.currentuser = User.query(id: 'kevin')
    console.log($scope.currentuser)

    $scope.getPlaylistSongs = (playlist) ->
        console.log("Getting Playlist Songs!", playlist)

        for _playlist in $scope.currentuser.playlists
            ## Quickly get the ID of the selected playlist
            if _playlist.title is playlist
                console.log(_playlist.id)
                playlistId = _playlist.id

        $scope.songs = Playlist.query(id: playlistId)
        console.log($scope.songs)
]