'use strict'

describe 'Service: Api', ->

  # load the service's module
  beforeEach module 'playlistApp'

  # instantiate service
  Api = {}
  beforeEach inject (_Api_) ->
    Api = _Api_

  it 'should do something', ->
    expect(!!Api).toBe true
