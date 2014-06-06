'use strict'

app = angular.module 'playlistApp'

app.controller 'AuthCtrl', ['$scope', 'UserRegister', ($scope, UserRegister) ->
    $scope.message = ""

    $scope.login = ->

    $scope.register = (user) ->
        UserRegister.register(user.username, user.password)
        console.log(UserRegister.checkMessage())

        return
    return
]