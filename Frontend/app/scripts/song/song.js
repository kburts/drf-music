(function() {
  'use strict';
  var app;

  app = angular.module('playlistApp');

  app.controller('SongListCtrl', [
    'SongList', '$scope', function(SongList, $scope) {
      return $scope.songs = SongList.query();
    }
  ]);

}).call(this);

/*
//@ sourceMappingURL=song.js.map
*/