(function() {
  'use strict';
  var app;

  app = angular.module('playlistApp');

  app.controller('PlaylistFormCtrl', [
    '$scope', 'PlaylistList', function($scope, PlaylistList) {
      $scope.createPlaylist = function(name, description) {
        var form;
        console.log(name, description);
        form = {
          'name': name,
          'description': description
        };
        return PlaylistList.save({
          'title': name,
          'description': description
        });
      };
    }
  ]);

}).call(this);

/*
//@ sourceMappingURL=playlistform.js.map
*/