'use strict'

describe 'Controller: UserctrlCtrl', ->

  # load the controller's module
  beforeEach module 'playlistApp'

  UserctrlCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    UserctrlCtrl = $controller 'UserctrlCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
