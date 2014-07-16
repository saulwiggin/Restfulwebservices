#!/usr/bin/ruby -w
# delicious-open-uri.rb

require 'rubygems'
require 'open-uri'
require 'rexml/document'

# Fetches a del.icio.us. user's recent bookmarks, and prints each one. 
def print_my_recent_bookmarks(username, p[assword)
#Make the HTPPS request.
response = open('https://api.del.icio.us/v1/posts/recent',
:http_basic_authentication +> [username, password])

#Read the response = open('https://api.del.icio.us/v1/posts/recent',
:h