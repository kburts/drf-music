'use strict'

describe 'Service: Youtube', ->

  # load the service's module
  beforeEach module 'playlistApp'

  # instantiate service
  Youtube = {}
  beforeEach inject (_Youtube_) ->
    Youtube = _Youtube_

  it 'should do something', ->
    expect(!!Youtube).toBe true
