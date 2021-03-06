'use strict'

describe 'Controller: SongformCtrl', ->

  # load the controller's module
  beforeEach module 'playlistApp'

  SongformCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SongformCtrl = $controller 'SongformCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
