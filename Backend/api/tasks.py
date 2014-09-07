import re
import requests

from music.celery import app

from .models import Playlist, Song, User

@app.task
def task():
    print 'Hello, world!'
    return 'Returned hello!'

@app.task
def create_playlist_from_yt(url, user):
    """
    Generate a playlist and populate it from a url to a youtube playlist
    args:
    url: youtube playlist url, examples:
        https://www.youtube.com/watch?v=PpJVIhidBXM&index=15&list=PLXNnxXrfrLitw1tTuUFigZhY4C2FZhvLe
        https://www.youtube.com/watch?v=k7Z7USWo2Lk&list=PLXNnxXrfrLitw1tTuUFigZhY4C2FZhvLe&index=18
    user: username (required)
    title: title of the playlist (default title from youtube)
    description: description of playlist (default auto-generated playlist from a youtube playlist url.)
    """
    playlist_id = re.search('list=\w+', url)
    playlist_id = playlist_id.group()[5:]

    if playlist_id is None:
        print 'No youtube playlist ID found in URL (should contain list=\\w+)'
        return 1

    # Make youtube api request
    api_key = "AIzaSyBvdmvgZzy3N59lM4pp_0L2h8u5cPD17ro"
    data = get_videos_from_playlist(playlist_id, api_key)

    playlist_title = requests.get((
        "https://www.googleapis.com/youtube/v3/playlists?part=snippet"
        "&id={0}"
        "&key={1}"
    ).format(playlist_id, api_key)).json()['items'][0]['snippet']['title']
    user = User.objects.get(username=user)
    playlist = Playlist(
        title = playlist_title,
        description = "auto-generated playlist from a youtube playlist url.",
        user = user)
    playlist.save()
    for item in data:
        song = Song(
            name = item[0],
            url = "https://www.youtube.com/watch?v=%s" %item[1],
            added_by = user
        )
        song.save()
        playlist.songs.add(song)
    return playlist.id


def get_videos_from_playlist(playlist_id, api_key):
    """
    Returns a list of tuples: [(title: video_id)...] of youtube videos and their youtube id's
    args:
    playlist_id -- Id of youtube playlist (eg. PLXNnxXrfrLitw1tTuUFigZhY4C2FZhvLe)
    api_key -- youtube api key
    """
    page_token = ""
    videos = []
    while True:
        # Request
        url = (
            "https://www.googleapis.com/youtube/v3/playlistItems?"
            "part=snippet"
            "&playlistId={0}"
            "&pageToken={1}"
            "&key={2}"
        ).format(playlist_id, page_token, api_key)
        data = requests.get(url).json()


        for item in data['items']:
            videos.append((item['snippet']['title'], item['snippet']['resourceId']['videoId']))
        if not 'nextPageToken' in data.keys():
            break
        else:
            page_token = data['nextPageToken']
    return videos