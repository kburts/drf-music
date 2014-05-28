'use strict'

app = angular.module('playlistApp')


app.run ->
    ## Boilerplate code that I've seen in everyone's version of this app.
    tag = document.createElement('script');
    tag.src = "http://www.youtube.com/iframe_api";
    firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
    
app.service 'YoutubePlayerService', ['Queue', '$window', '$rootScope', '$log', (Queue, $window, $rootScope, $log) ->
    service = this
    queue = []

    youtube = {
        ready: false,
        player: null,
        playerId: null,
        videoId: null,
        videoTitle: null,
        playerHeight: '480',
        playerWidth: '640',
        state: 'stopped'
    };

    $window.onYouTubeIframeAPIReady = ->
        $log.info('Youtube API is ready')
        youtube.ready = true
        service.bindPlayer('placeholder')
        service.loadPlayer()
        $rootScope.$apply()


    onYoutubeReady = (event) ->
        $log.info "YouTube Player is ready"
        youtube.player.cueVideoById 'pMkYn1SQSs4'
        youtube.videoId = 'pMkYn1SQSs4'
        youtube.videoTitle = "Good Eats - S09E10P01 - Great Balls O' Meat"

    @bindPlayer = (elementId) ->
        $log.info "Binding to " + elementId
        youtube.playerId = elementId

    @createPlayer = ->
        $log.info "Creating a new Youtube player for DOM id " + youtube.playerId + " and video " + youtube.videoId
        new YT.Player(youtube.playerId,
            height: youtube.playerHeight
            width: youtube.playerWidth
            playerVars:
              rel: 0
              showinfo: 0

            events:
              onReady: onYoutubeReady
              #onStateChange: onYoutubeStateChange
        )

    @loadPlayer = ->
        if youtube.ready and youtube.playerId
            youtube.player.destroy()  if youtube.player
            youtube.player = service.createPlayer()
        
    @launchPlayer = (id, title) ->
        youtube.player.loadVideoById(id)
        youtube.videoId = id
        youtube.videoTitle = title
        youtube # return youtube (coffeescript is crazy :/)

    @getYoutube = ->
        youtube

    return
]