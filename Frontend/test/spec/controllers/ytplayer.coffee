'use strict'

describe 'Controller: YtplayerCtrl', ->

  # load the controller's module
  beforeEach module 'playlistApp'

  YtplayerCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    YtplayerCtrl = $controller 'YtplayerCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
