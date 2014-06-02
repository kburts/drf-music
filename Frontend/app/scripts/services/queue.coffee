'use strict'

app = angular.module('playlistApp')

app.factory 'Queue', ->
    # Queue for setting/sharing the songs to be played.
    # Queue is an array of arrays like: [[songname1, yt_id1], [songname2, yt_id2], ...]
    queue = [] # Same as = new Array(); according to the internet, but way more pythonic!

    clearQueue: ->
        queue = []
        return

    addToEndQueue: (song)-> 
        queue.push(song)
        return
    addToStartQueue: (song) -> 
        queue.unshift(song)
        return

    shuffleQueue: ->
        # http://coffeescriptcookbook.com/chapters/arrays/shuffling-array-elements
        for i in [queue.length-1..1]
            j = Math.floor Math.random() * (i + 1)
            [queue[i], queue[j]] = [queue[j], queue[i]]

    setQueue: (new_queue) -> 
        queue = new_queue
        return
    getQueue: -> queue
