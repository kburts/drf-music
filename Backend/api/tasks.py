import re
import requests

from music.celery import app

@app.task
def task():
    print 'Hello, world!'
    return 'Returned hello!'

@app.task
def create_playlist_from_yt(url):
    playlist_id = re.search(r'list=\w+', url)[5:]
    if playlist_id is None:
        print 'No youtube playlist ID found in URL (should contain list=\\w+)'

    # Make youtube api request
    page_token = ""
    api_key = "AIzaSyBvdmvgZzy3N59lM4pp_0L2h8u5cPD17ro"
    url = """
        https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId={0}&pageToken={1}&key={2}
        """.format(playlist_id, page_token, api_key)
    print requests.get(url).json()