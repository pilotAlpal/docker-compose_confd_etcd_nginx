from flask import Flask
import time
import datetime

app=Flask(__name__)
@app.route('/dtime')
def dtime():
   ts = time.time()
   dt = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
   return 'Date: %s' % dt

@app.route('/greet')
def greet():
   return 'Hello buddy'


if __name__ == '__main__':
   app.run(host="0.0.0.0",port=8081)

