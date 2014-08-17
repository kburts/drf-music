(function() {
  'use strict';
  var app;

  app = angular.module('api');

  app.factory('JWTAuth', [
    '$rootScope', '$q', '$window', function($rootScope, $q, $window) {
      return {
        request: function(config) {
          if (config.method === "POST" || config.url === 'http://localhost:8000/api/users/me/ ') {
            console.log("request config!", config);
            config.headers = config.headers || {};
            if ($window.sessionStorage.token) {
              config.headers.Authorization = 'JWT ' + $window.sessionStorage.token;
              console.log("Added token to headers", config.headers);
            } else {
              console.log('no session token');
            }
          }
          return config;
        },
        responseError: function(response) {
          if (response.status === 401) {
            console.log('not authorized.');
          } else {
            console.log('ERROR!', response);
          }
          return $q.reject(response);
        }
      };
    }
  ]);

  app.config([
    '$httpProvider', function($httpProvider) {
      $httpProvider.interceptors.push('JWTAuth');
      $httpProvider.defaults.useXDomain = true;
      delete $httpProvider.defaults.headers.common['X-Requested-With'];
      $httpProvider.defaults.headers.common['Content-Type'] = 'application/json';
      return $httpProvider.defaults.headers.post['Accept'] = 'application/json';
    }
  ]);

}).call(this);

/*
//@ sourceMappingURL=jwtauth.js.map
*/