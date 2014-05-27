app = angular.module 'example.app.basic', ['example.api']


app.service 'sharedProperties',  ->
    sharedSong = "SHARED"
    getSong: -> sharedSong
    setSong: (song) -> sharedSong = song


app.controller 'PlaylistCtrl', ['Playlist', 'sharedProperties', '$scope', '$http', (Playlist, sharedProperties, $scope, $http) ->
    $scope.hello = "hello!"
    $scope.songs = Playlist.query(id: 1)
    $scope.currentsong = ''
    $scope.playSong = ->
        $scope.currentsong = this.song.name
        $scope.currentsong.id = this.song.url
]