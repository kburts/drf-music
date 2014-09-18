'use strict';

angular.module('api', ['ngResource']);

angular
  .module('api')
  .constant('APIBase', 'http://localhost:8000/');

angular
  .module('api')
  .config(config);

function config($httpProvider) {
  $httpProvider.interceptors.push('JWTAuth');
  //$httpProvider.defaults.useXDomain = true;
  delete $httpProvider.defaults.headers.common['X-Requested-With'];
  $httpProvider.defaults.headers.common['Content-Type'] = 'application/json';
  $httpProvider.defaults.headers.post['Accept'] = 'application/json';
};
