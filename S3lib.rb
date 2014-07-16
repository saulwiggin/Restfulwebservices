#!/usr/bin/ruby -w
# SW3lib.rb

#Libraries neccessary for making HTTP requests and parsing responses.
require 'rubygems'
require 'rest-open-uri'
require 'rexml/document'

# Libraries neccassary for requrest signing
require 'openssl'
require 'digest/sha1'
require 'base64'
require 'uri'

module S3 #This is the beginning of a big, all-encompassing module.

module Authorized
#Enter your public key (Amzon calls it an "Access Key ID") and
# your private key (Amzon calls it a "Secret Access Key ID"). This
# is so you can sign your S3 requests and Amzon will know who to 
# charge
@@public_key = ''
@@private_key = ''

if @@public_key.empty? or @@private_key.empty?
raise "You need to set your S3 keys."
end

#You shouldn't need to change this unless you're using an S3 clone like 
# Park place.
HOST = 'http://s3.amazonaws.com/'
end

