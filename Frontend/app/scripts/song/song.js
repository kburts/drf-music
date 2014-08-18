'use strict';

angular
  .module('playlistApp')
  .controller('SongListCtrl', SongListCtrl);

function SongListCtrl (SongList, $scope) {
  return $scope.songs = SongList.query();
};