'use strict';

angular
  .module('playlistApp')
  .factory('Queue', Queue);


function Queue() {
  var Factory = {};
  var observerCallbacks = [];
  Factory.queue = [];

  Factory.registerObserverCallback = function(callback){
    observerCallbacks.push(callback);
  };

  //call this when you know 'foo' has been changed
  var notifyObservers = function(){
    angular.forEach(observerCallbacks, function(callback){
      callback();
    });
  };

  Factory.clearQueue = function() {
    Factory.queue = [];
    notifyObservers();
  };
  Factory.addToEndQueue = function(song) {
    Factory.queue.push(song);
    notifyObservers();
  };
  Factory.addToStartQueue = function(song) {
    Factory.queue.unshift(song);
    notifyObservers();
  };
  Factory.shuffleQueue = function() {
    var i, j, _i, _ref, _ref1, _results;
    _results = [];
    for (i = _i = _ref = Factory.queue.length - 1; _ref <= 1 ? _i <= 1 : _i >= 1; i = _ref <= 1 ? ++_i : --_i) {
      j = Math.floor(Math.random() * (i + 1));
      _results.push((_ref1 = [Factory.queue[j], Factory.queue[i]], Factory.queue[i] = _ref1[0], Factory.queue[j] = _ref1[1], _ref1));
    }
    return _results;
  };
  Factory.shiftQueue = function() {
    // Remove first element in the queue.
    Factory.queue.shift();
    notifyObservers();
  }


  Factory.setQueue = function(new_queue) {
    Factory.queue = [];
    Factory.queue.push(new_queue);
    notifyObservers();
  };
  Factory.getQueue = function() {
    return Factory.queue;
  };

  return Factory;
};
