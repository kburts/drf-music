'use strict'

app = angular.module('playlistApp')

app.factory 'JWTAuth', ($rootScope, $q, $window) ->
    request: (config) ->
        config.headers = config.headers or {};
        if ($window.sessionStorage.token)
            config.headers.Authorization = 'JWT ' + $window.sessionStorage.token;
        else
            console.log('no session token')
        return config;

#    response: (response) ->
#        return response || $q.when(response)

    responseError: (response) ->
        if response.status is 401
            console.log('not authorized.') 
        return $q.reject(response);    
        

app.config ($httpProvider) ->
    $httpProvider.interceptors.push('JWTAuth')
