'use strict'

app = angular.module 'api', ['ngResource']

app.factory 'Playlist', ['$resource', ($resource) ->
    $resource 'http://localhost:8000/api/playlist/:id/', {id: '@id'} , 'query': {method: 'GET', isArray: false }
]

app.factory 'PlaylistList', ['$resource', ($resource) ->
    $resource 'http://localhost:8000/api/playlist/:id/', {id: '@id'} , 'query': {method: 'GET', isArray: true }
]

app.factory 'Song', ['$resource', ($resource) ->
    $resource 'http://localhost:8000/api/song/:id', id: '@id'
]