'use strict'

describe 'Service: queue', ->

  # load the service's module
  beforeEach module 'playlistApp'

  # instantiate service
  queue = {}
  beforeEach inject (_queue_) ->
    queue = _queue_

  it 'should do something', ->
    expect(!!queue).toBe true
