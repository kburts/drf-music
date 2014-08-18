'use strict';

angular
  .module('playlistApp')
  .controller('PlaylistFormCtrl');

function PlaylistFormCtrl ($scope, PlaylistList) {
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
};