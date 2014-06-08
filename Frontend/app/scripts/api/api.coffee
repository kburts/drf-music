'use strict'

app = angular.module 'api', ['ngResource']

app.constant('APIBase', 'http://localhost:8000/')


## Playlist Endpoints
app.factory 'Playlist', ['$resource', 'APIBase', ($resource, APIBase) ->
    $resource APIBase + 'api/playlist/:id\/ ', 
        id: '@id', 
            'query': method: 'GET', isArray: false
]


app.factory 'PlaylistList', ['$resource', 'APIBase', 'JWTAuth', ($resource, APIBase, JWTAuth) ->
    $resource APIBase + 'api/playlist\/ ', {},
        'query': method: 'GET', isArray: true
        'save': method: 'POST'
]


## Song Endpoints
app.factory 'Song', ['$resource', 'APIBase', ($resource, APIBase) ->
    $resource APIBase + 'api/song/:id\/ ', 
        id: '@id'
]

app.factory 'SongList', ['$resource', 'APIBase', ($resource, APIBase) ->
    $resource APIBase + 'api/song\/ '
]


## User Endpoints
app.factory 'User', ['$resource', 'APIBase', ($resource, APIBase) ->
    $resource APIBase + 'api/users/:id\/ ',
    	id: '@id',
    	isArray: false

]

app.factory 'UserList', ['$resource', 'APIBase', ($resource, APIBase) ->
    $resource APIBase + 'api/users\/ '
]

