'use strict'

app = angular.module 'api', ['ngResource']


app.factory 'Playlist', ['$resource', ($resource) ->
    $resource 'http://localhost:8000/api/playlist/:id\/', {id: '@id'} , 'query': {method: 'GET', isArray: false }
]

app.factory 'PlaylistList', ['$resource', ($resource) ->
    $resource 'http://localhost:8000/api/playlist\/', {id: '@id'} , 'query': {method: 'GET', isArray: true }
]

app.factory 'Song', ['$resource', ($resource) ->
    $resource 'http://localhost:8000/api/song/:id\/', id: '@id'
]

app.factory 'SongList', ['$resource', ($resource) ->
    $resource 'http://localhost:8000/api/song\/'
]

app.factory 'UserRegister', ['$http', ($http) ->
    message = ''
    register: (username, password) ->
        $http(
            method: 'POST'
            url: ('http://localhost:8000/api/users/register/')
            data: 
                'username': username
                'password': password
        ).success (data, status, headers, config) ->
            message = 'Success!'
        .error (data, status, headers, config) -> 
            message = data
            console.log(message)

    checkMessage: ->
        return "message: " + message

]