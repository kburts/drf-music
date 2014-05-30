'use strict'

describe 'Controller: SongCtrl', ->

  # load the controller's module
  beforeEach module 'playlistApp'

  SongCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SongCtrl = $controller 'SongCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
