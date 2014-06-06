'use strict'

app = angular.module 'playlistApp'

app.controller 'AuthCtrl', ['$scope', '$http', 'UserRegister', 'APIBase', ($scope, $http, UserRegister, APIBase) ->
    $scope.message = ""
    $scope.username = ""

    $scope.login = (user) ->
        console.log(APIBase)

    $scope.register = (user) ->
        $http(
            method: 'POST'
            url: (APIBase + 'api/users/register/')
            data: 
                'username': user.username
                'password': user.password
        ).success (data, status, headers, config) ->
            $scope.message = 'Success!'
        .error (data, status, headers, config) -> 
            console.log(data)
            $scope.message = status + " - " + JSON.stringify(data)

        return
    return
]