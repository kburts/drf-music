'use strict'

app = angular.module('playlistApp')

app.factory 'Queue', ->
    # Queue for setting/sharing the songs to be played.
    queue = []

    getQueue: -> queue
    setQueue: (new_queue) -> queue = new_queue
