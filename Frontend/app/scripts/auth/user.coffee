'use strict'

app = angular.module('playlistApp')

app.controller 'UserCtrl', ['$scope', '$http', '$window', ($scope, $http, $window) ->

    $scope.user = {username: 'test1', password: '1'};
    $scope.submituser = 'username=test1&password=1'
    $scope.message = '';
    $scope.submit = ->    
        $http.post('http://localhost:8000/api-token-auth/', data={'username':'kevin', 'password': '1'}, headers={"Content-Type": "application/json"})
            .success (data, status, headers, config) ->
                $window.sessionStorage.token = data.token
                $scope.message = 'Welcome'
                console.log('assigned you a token!')
                console.log(data.token)
                return
            .error (data, status, headers, config) ->
                # Erase the token if the user fails to log in
                delete $window.sessionStorage.token;
                $scope.message = 'Error: Invalid user or password';
                return
        return

    $scope.testAuth = ->
        $http.get('http://localhost:8000/api/playlist/2/')
            .success (data, status, headers, config) ->
                console.log('accessed granted!')
                console.log(data)
        return
    return
]

