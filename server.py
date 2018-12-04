from BaseHTTPServer import *
from urlparse import urlparse
import urllib2
import os
import subprocess
import time

def pathOKCheck(path):
    if path.startswith("/home"):
        return True
    return False

def doDate(params):
    return time.time()

def doDir(params):
    if not pathOKCheck(params):
        return "forbidden"
    d = os.listdir(params)
    return '\n'.join(d)

def doCat(params):
    if not pathOKCheck(params):
        return "forbidden"
    return open(params, "r").read()

def doExec(params):
    if not pathOKCheck(params):
        return "forbidden"
    return subprocess.check_output(params.split(" "))
   
paths = { 
        '/date': doDate,
        '/dir': doDir,
        '/cat': doCat,
	'/': doExec
        }

class MyWebServer(BaseHTTPRequestHandler):
    def do_GET(self):
        url = urlparse(self.path)
        self.send_response(200)
        self.end_headers()
        path = url.path
        queryString = url.query

        if not paths.has_key(path):
            self.wfile.write("No such command")
            return
        output = paths[path](urllib2.unquote(queryString))
        self.wfile.write(output)

server = HTTPServer(('',1234), MyWebServer)
server.serve_forever()


