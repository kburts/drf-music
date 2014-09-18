'use strict';

angular
  .module('api')
  .factory('Playlist', Playlist)
  .factory('PlaylistList', PlaylistList);

angular
  .module('api')
  .factory('Song', Song)
  .factory('SongList', SongList);

angular
  .module('api')
  .factory('User', User)
  .factory('UserList', UserList)
  .factory('UserCurrent', UserCurrent);

function Playlist ($resource, APIBase) {
  return $resource(APIBase + 'api/playlist/:id/ ', {
    id: '@id'
  }, {
    'query': {
      method: 'GET',
      isArray: false
    }
  });
};

function PlaylistList ($resource, APIBase, JWTAuth) {
  return $resource(APIBase + 'api/playlist/ ', {}, {
    'query': {
      method: 'GET',
      isArray: true
    },
    'save': {
      method: 'POST'
    }
  });
};

function Song ($resource, APIBase) {
  return $resource(APIBase + 'api/song/:id/ ', {
    id: '@id'
  });
};

function SongList ($resource, APIBase) {
  return $resource(APIBase + 'api/song/ ');
};


function User($resource, APIBase) {
  return $resource(APIBase + 'api/users/:username/ ', {
    username: '@username'
  }, {
    'query': {
      method: 'GET',
      isArray: false
    }
  });
};


function UserList ($resource, APIBase) {
  return $resource(APIBase + 'api/users/ ');
};


function UserCurrent ($resource, APIBase) {
  return $resource(APIBase + 'api/users/me/ ', {}, {
    'query': {
      method: 'GET'
    }
  });
};

