'use strict';

angular
  .module('playlistApp')
  .controller('AuthCtrl', AuthCtrl);

function AuthCtrl($scope, $http, $window, $interval, $location, APIBase) {
  $scope.getUsername = function() {
    return $http({
      method: 'GET',
      url: APIBase + 'api/users/me\/',
      headers: {
        'Authorization': 'JWT ' + $window.sessionStorage.token
      }
    }).success(function(data, status, headers, config) {
      $scope.username = data.username;
      $scope.loggedIn = true;
      console.log("Successfully authenticated (for now...)");
    }).error(function(data, status, headers, config) {
      $scope.logout();
    });
  };
  $interval(function() {
    if ($window.sessionStorage.token !== void 0) {
      $scope.getUsername();
    } else {
      $scope.logout();
    }
  }, 60000);
  $scope.login = function(user) {
    var data, headers;
    $http.post(APIBase + 'api-token-auth/', data = {
      'username': user.username,
      'password': user.password
    }, headers = {
      "Content-Type": "application/json"
    }).success(function(data, status, headers, config) {
      $window.sessionStorage.token = data.token;
      $window.sessionStorage.username = user.username;
      $scope.message = 'Welcome';
      console.log('assigned you a token!');
      console.log(data.token);
      $scope.loggedIn = true;
      $scope.getUsername();
    }).error(function(data, status, headers, config) {
      delete $window.sessionStorage.token;
      delete $window.sessionStorage.username;
      $scope.message = 'Error: Invalid user or password';
    });
  };
  $scope.logout = function() {
    $scope.loggedIn = false;
    $scope.username = void 0;
    delete $window.sessionStorage.token;
    delete $window.sessionStorage.username;
    //$location.path("/#/");
  };
  $scope.register = function(user) {
    return $http({
      method: 'POST',
      url: APIBase + 'api/users/register\/',
      data: {
        'username': user.username,
        'password': user.password
      }
    }).success(function(data, status, headers, config) {
      return $scope.message = status + "- Success! Login!";
    }).error(function(data, status, headers, config) {
      return $scope.message = status + " - " + JSON.stringify(data);
    });
  };
  $scope.message = "";
  $scope.getUsername();
};

