'use strict'

app = angular.module 'api'

app.factory 'JWTAuth', ['$rootScope', '$q', '$window', ($rootScope, $q, $window) ->
    request: (config) ->
        if config.method is "POST"
            console.log("request config!", config)
            config.headers = config.headers or {};
            if ($window.sessionStorage.token)
                config.headers.Authorization = 'JWT ' + $window.sessionStorage.token;
                console.log("Added token to headers", config.headers)
            else
                console.log('no session token')
        return config


    responseError: (response) ->
        if response.status is 401
            console.log('not authorized.') 
        else
            console.log('ERROR!', response)
        return $q.reject(response);    
]

app.config ['$httpProvider', ($httpProvider) ->
    $httpProvider.interceptors.push('JWTAuth')
    ## Remove CORS for cross domain ajax requests
    ## Without this, you cannot send headers to other domain servers
    ## (I think...)
    $httpProvider.defaults.useXDomain = true

    delete $httpProvider.defaults.headers.common['X-Requested-With']
    $httpProvider.defaults.headers.common['Content-Type'] = 'application/json'
    $httpProvider.defaults.headers.post['Accept'] = 'application/json'
]