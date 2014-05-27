app = angular.module 'example.api', ['ngResource']

app.factory 'Playlist', ['$resource', ($resource) ->
    $resource '/api/playlist/:id/', {id: '@id'} , 'query': {method: 'GET', isArray: false }
]

app.factory 'Song', ['$resource', ($resource) ->
    $resource '/api/song/:id', id: '@id'
]


###
OLD STUFF
Fron Kevinastone's awesome django-angular tutorial!
app.factory 'User', ['$resource', ($resource) ->
    $resource '/api/users/:username', username: '@username'
]

app.factory 'Post', ['$resource', ($resource) ->
    $resource '/api/posts/:id', id: '@id'
]

app.factory 'Photo', ['$resource', ($resource) ->
    $resource '/api/photos/:id', id: '@id'
]



# And the nested resources
app.factory 'UserPost', ['$resource', ($resource) ->
    $resource '/api/users/:username/posts/:id'
]

app.factory 'PostPhoto', ['$resource', ($resource) ->
    $resource '/api/posts/:post_id/photos/:id'
]
###