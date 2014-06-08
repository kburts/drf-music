'use strict'

app = angular.module 'playlistApp'

app.controller 'AuthCtrl', ['$scope', '$http', '$window', '$interval', 'APIBase', ($scope, $http, $window, $interval, APIBase) ->
    $scope.getUsername = ->
        $http(
            method: 'GET'
            url: (APIBase + 'api/users/me\/')
            headers:
                'Authorization': 'JWT ' + $window.sessionStorage.token
        ).success (data, status, headers, config) ->
            $scope.username = data.username
            $scope.loggedIn = true
            console.log("Successfully authenticated (for now...)")
            return
        .error (data, status, headers, config) ->
            $scope.logout()
            return

    ## Check to see if the user is logged in (every interval seconds)
    $interval ->
        if loggedIn = true
            $scope.getUsername()
            return
        else
            return
    ,60000

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
                $scope.loggedIn = true                
                $scope.getUsername()
                return
            .error (data, status, headers, config) ->
                # Erase the token if the user fails to log in
                delete $window.sessionStorage.token;
                $scope.message = 'Error: Invalid user or password';
                return
        return

    $scope.logout = ->
        $scope.loggedIn = false
        $scope.username = undefined
        delete($window.sessionStorage.token)        

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

    $scope.message = ""
    $scope.getUsername()
    return
]