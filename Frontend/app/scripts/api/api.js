(function() {
  'use strict';
  var app;

  app = angular.module('api', ['ngResource']);

  app.constant('APIBase', 'http://localhost:8000/');

  app.factory('Playlist', [
    '$resource', 'APIBase', function($resource, APIBase) {
      return $resource(APIBase + 'api/playlist/:id\/ ', {
        id: '@id'
      }, {
        'query': {
          method: 'GET',
          isArray: false
        }
      });
    }
  ]);

  app.factory('PlaylistList', [
    '$resource', 'APIBase', 'JWTAuth', function($resource, APIBase, JWTAuth) {
      return $resource(APIBase + 'api/playlist\/ ', {}, {
        'query': {
          method: 'GET',
          isArray: true
        },
        'save': {
          method: 'POST'
        }
      });
    }
  ]);

  app.factory('Song', [
    '$resource', 'APIBase', function($resource, APIBase) {
      return $resource(APIBase + 'api/song/:id\/ ', {
        id: '@id'
      });
    }
  ]);

  app.factory('SongList', [
    '$resource', 'APIBase', function($resource, APIBase) {
      return $resource(APIBase + 'api/song\/ ');
    }
  ]);

  app.factory('User', [
    '$resource', 'APIBase', function($resource, APIBase) {
      return $resource(APIBase + 'api/users/:username\/ ', {
        username: '@username'
      }, {
        'query': {
          method: 'GET',
          isArray: false
        }
      });
    }
  ]);

  app.factory('UserList', [
    '$resource', 'APIBase', function($resource, APIBase) {
      return $resource(APIBase + 'api/users\/ ');
    }
  ]);

  app.factory('UserCurrent', [
    '$resource', 'APIBase', function($resource, APIBase) {
      return $resource(APIBase + 'api/users/me\/ ', {}, {
        'query': {
          method: 'GET'
        }
      });
    }
  ]);

}).call(this);

/*
//@ sourceMappingURL=api.js.map
*/