'use strict';

angular
  .module('playlistApp')
  .factory('Queue', Queue);


function Queue() {
  var queue;
  queue = [];
  return {
    clearQueue: function() {
      queue = [];
    },
    addToEndQueue: function(song) {
      queue.push(song);
    },
    addToStartQueue: function(song) {
      queue.unshift(song);
    },
    shuffleQueue: function() {
      var i, j, _i, _ref, _ref1, _results;
      _results = [];
      for (i = _i = _ref = queue.length - 1; _ref <= 1 ? _i <= 1 : _i >= 1; i = _ref <= 1 ? ++_i : --_i) {
        j = Math.floor(Math.random() * (i + 1));
        _results.push((_ref1 = [queue[j], queue[i]], queue[i] = _ref1[0], queue[j] = _ref1[1], _ref1));
      }
      return _results;
    },
    setQueue: function(new_queue) {
      queue = new_queue;
    },
    getQueue: function() {
      return queue;
    }
  };
};
