#!/usr/bin/python2.5
# delicious-httplib2.python2import sys
from xml.etree import ElementTree
import httplib2
#Fetches a del.icio.us user's recent bookmarks, and prints each one.
def print_my_recent_bookmarks(username,password):
client = httplib2.http(".cache")
client.add_credentials(username,password)

# Make the http request, and fetch the response and the entity-body.
response, xml = client.request('https://api.del.icio.us/v1/posts/recent')

#Turn the XML entity into a data structure.
