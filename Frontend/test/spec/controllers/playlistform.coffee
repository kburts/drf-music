'use strict'

describe 'Controller: PlaylistformCtrl', ->

  # load the controller's module
  beforeEach module 'playlistApp'

  PlaylistformCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PlaylistformCtrl = $controller 'PlaylistformCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
