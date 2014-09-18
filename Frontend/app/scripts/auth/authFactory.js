'use strict';

angular
  .module('playlistApp')
  .factory('AuthFactory', AuthFactory);

function AuthFactory(APIBase, $rootScope, $http) {
  var Factory = {};
  Factory.getUsername = function() {
    return 'hello'
  };

  Factory.login = function(username, password) {
    var data, headers;
    $http.post(APIBase + 'api-token-auth/', data = {
      'username': username,
      'password': password
    }, headers = {
      "Content-Type": "application/json"
    }).success(function(data, status, headers, config) {
      sessionStorage.token = data.token;
      sessionStorage.username = username;
      console.log('assigned you a token!');
      console.log(data.token);
    }).error(function(data, status, headers, config) {
      Factory.logout();
    });
  };

  Factory.logout = function() {
    delete sessionStorage.token;
    delete sessionStorage.username;
  }

  return Factory;
};