'use strict'

app = angular.module 'playlistApp'

app.controller 'PlaylistFormCtrl', ['$scope', 'PlaylistList', ($scope, PlaylistList) ->
    $scope.createPlaylist = (name, description) ->
        console.log(name, description)
        form = 
            'name': name
            'description': description

        PlaylistList.save({'title': name, 'description': description})
    return
]