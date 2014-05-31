'use strict'

app = angular.module('playlistApp')

  
app.service 'YoutubePlayerService', ['Queue', '$window', '$rootScope', '$log', (Queue, $window, $rootScope, $log) ->
    service = this
    queue = []
    events = ""

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
        youtube.player.cueVideoById '0vyuFj__YOs'
        youtube.videoId = '0vyuFj__YOs'
        youtube.videoTitle = "Elaina's Theme"

    onYoutubeStateChange = (event) ->
        if event.data is YT.PlayerState.PLAYING
            $log.info("State: Playing!")
            youtube.state = 'playing'
            $rootScope.$broadcast('event', youtube.state)
        if event.data is YT.PlayerState.ENDED
            youtube.state = 'ended'
            $log.info("Song ended, going to next one!")
            $rootScope.$broadcast('event', youtube.state)
        $rootScope.$apply()
        return

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
              onStateChange: onYoutubeStateChange
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