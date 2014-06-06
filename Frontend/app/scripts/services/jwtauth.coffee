'use strict'

app = angular.module 'playlistApp'

app.factory 'JWTAuth', ['$rootScope', '$q', '$window', ($rootScope, $q, $window) ->
    request: (config) ->
        config.headers = config.headers or {};
        if ($window.sessionStorage.token)
            config.headers.Authorization = 'JWT ' + $window.sessionStorage.token;
        else
            console.log('no session token')
        return config;

    responseError: (response) ->
        if response.status is 401
            console.log('not authorized.') 
        return $q.reject(response);    
]

app.config ['$httpProvider', ($httpProvider) ->
    #$httpProvider.interceptors.push('JWTAuth')
    ## Remove CORS for cross domain ajax requests
    ## Without this, you cannot send headers to other domain servers
    ## (I think...)
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']
    $httpProvider.defaults.headers.common['Content-Type'] = 'application/json'
    $httpProvider.defaults.headers.post['Accept'] = 'application/json'
]