'use strict'

app = angular.module 'playlistApp'

#app.run ->
#    ## Boilerplate code that I've seen in everyone's version of this app.
#    tag = document.createElement('script');
#    tag.src = "http://www.youtube.com/iframe_api";
#    firstScriptTag = document.getElementsByTagName('script')[0];
#    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);


app.controller 'MainCtrl', ['$scope', '$window', 'Playlist',  ($scope, $window, Playlist) ->
    $scope.hello = "scope hellohello"
    $scope.awesomeThings = [
        'HTML5 Boilerplate'
        'AngularJS'
        'Karma'
    $scope.apicall = Playlist.query()
    ]
]



