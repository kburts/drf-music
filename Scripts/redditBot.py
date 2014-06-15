"""
Script to get data from reddit(specificly /r/listentothis or /r/music. It is supposed to be
independent from the Django stuff.

Creates a new playlist on server with:
    title: Listentothis
    description: date created and objective of playlist
    songs: front page of /r/listentothis

NOTE: Only works with YouTube. No soundcloud... yet
"""

import json
import requests
import sys

## Gather information variables
REDDIT = 'http://reddit.com/r/'
SUBREDDIT = 'listentothis'

## Use information variables
SERVER = 'http://127.0.0.1:8000/'

def CollectRedditData():
    toPost = []

    data = requests.get(REDDIT + SUBREDDIT + '.json')
    data = json.loads(data.text).get('data').get('children')

    for post in data:
        if "youtube.com/" in post.get('data').get('url'):
            toPost.append(
                {'title': post.get('data').get('title'),
                 'url': post.get('data').get('url')}
            )
        else:
            print 'removed non YT link!'

    return toPost

## Send data to server
def addSong(song, token, playlistID):
    songAPIEndpoint = SERVER + 'api/song/'
    s = requests.post(
        url = songAPIEndpoint,
        data = ({
            'name': song.get('title'),
            'url': song.get('url'),
            'playlist': playlistID
            }),
        headers = ({
            'Authorization': 'JWT %s' %token.json().get('token')
        })
    )
    print s
    print s.text

def createPlaylist(password, token):
    playlistAPIEndpoint = SERVER + 'api/playlist/'
    playlist = requests.post(
        url = playlistAPIEndpoint,
        data = ({
            'title': '/r/listentothis',
            'description': 'Auto-generated playlist'
            }),
        headers = ({
            'Authorization': 'JWT %s' %token.json().get('token')
        })
    )
    return playlist.json().get('id')
  

def UploadToServer(songs, password, user='listentothis'):
    ## Get JWT Token
    jwtUrl = SERVER + 'api-token-auth/'
    token = requests.post(
        url = jwtUrl,
        data = ({
            'username': user,
            'password': password
        })
    )
    ## Create new playlist
    playlist = createPlaylist(password, token)
    
    ## Upload new songs to server
    for song in songs:
        addSong(song, token, playlist)
    

        

if __name__ == "__main__":
    try:
        password = sys.argv[1]
    except:
        print "Supply system argument with password"
        sys.exit()

    data = CollectRedditData()
    UploadToServer(data, password)

