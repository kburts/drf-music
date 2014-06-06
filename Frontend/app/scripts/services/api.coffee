'use strict'

app = angular.module 'api', ['ngResource']

app.constant('APIBase', 'http://localhost:8000/')


app.factory 'Playlist', ['$resource', 'APIBase', ($resource, APIBase) ->
    $resource APIBase + 'api/playlist/:id\/', 
        id: '@id', 
            'query': {method: 'GET', isArray: false }
]

app.factory 'PlaylistList', ['$resource', 'APIBase', ($resource, APIBase) ->
    $resource APIBase + 'api/playlist\/ ', {},
        'query': {method: 'GET', isArray: true }
        'save': {method: 'POST'}#, interceptor: 
            #responseError: (data) -> console.log('error in interceptor', data)}
]

app.factory 'Song', ['$resource', 'APIBase', ($resource, APIBase) ->
    $resource APIBase + 'api/song/:id\/', 
        id: '@id'
]

app.factory 'SongList', ['$resource', 'APIBase', ($resource, APIBase) ->
    $resource APIBase + 'api/song\/'
]