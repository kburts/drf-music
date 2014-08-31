from music.celery import app

@app.task
def task():
    print 'Hello, world!'
    return 'Returned hello!'