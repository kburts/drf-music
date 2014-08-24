'use strict';

angular
  .module('api')
  .factory('JWTAuth', JWTAuth);

function JWTAuth ($rootScope, $q, $window) {
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
};
