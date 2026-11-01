import time
import json
from flask import Flask, Response

data = ["Esto", "es", "una", "respusta", "enviada", "a", "trozos"]

def event_stream():
    for element in data:
        yield f'{message}\n\n' #{json.dumps({'data': element})}
        time.sleep(1)

app = Flask(__name__)

@app.route('/events')
def events():
    return Response(event_stream(), mimetype='text/event-stream')

if __name__ == '__main__':
    app.run(debug=True)