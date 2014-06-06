'use strict'

app = angular.module 'playlistApp'

app.controller 'AuthCtrl', ['$scope', '$http', '$window', 'APIBase', ($scope, $http, $window, APIBase) ->
    $scope.message = ""
    $scope.loggedIn = true if sessionStorage.token 




    $scope.login = (user) ->
        $http.post(
            APIBase + 'api-token-auth/'
            data={'username': user.username, 'password': user.password} 
            headers={"Content-Type": "application/json"}
            ).success (data, status, headers, config) ->
                $window.sessionStorage.token = data.token
                $scope.message = 'Welcome'
                console.log('assigned you a token!')
                console.log(data.token)
                $scope.getUsername()
                return
            .error (data, status, headers, config) ->
                # Erase the token if the user fails to log in
                delete $window.sessionStorage.token;
                $scope.message = 'Error: Invalid user or password';
                return
        return


    $scope.register = (user) ->
        $http(
            method: 'POST'
            url: (APIBase + 'api/users/register\/')
            data: 
                'username': user.username
                'password': user.password
        ).success (data, status, headers, config) ->
            $scope.message = status + "- Success! Login!"
        .error (data, status, headers, config) -> 
            $scope.message = status + " - " + JSON.stringify(data)

    $scope.getUsername = ->
        $http(
            method: 'GET'
            url: (APIBase + 'api/users/me\/')
            headers:
                'Content-Type': 'application/json'
                'Authorization': 'JWT ' + $window.sessionStorage.token
                'Accept': 'application/json'
        ).success (data, status, headers, config) ->
            $scope.username = (data.username or none)
            console.log($scope.username)
        .error (data, status, headers, config) ->
            console.log('error getting username!')
            console.log(data)

    $scope.getUsername()
    return
]