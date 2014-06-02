'use strict'

describe 'Service: JWTAuth', ->

  # load the service's module
  beforeEach module 'playlistApp'

  # instantiate service
  JWTAuth = {}
  beforeEach inject (_JWTAuth_) ->
    JWTAuth = _JWTAuth_

  it 'should do something', ->
    expect(!!JWTAuth).toBe true
