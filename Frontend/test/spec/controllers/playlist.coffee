'use strict'

describe 'Controller: PlaylistctrlCtrl', ->

  # load the controller's module
  beforeEach module 'playlistApp'

  PlaylistctrlCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PlaylistctrlCtrl = $controller 'PlaylistctrlCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
