#!/usr/bin/ruby
# fetch-oreilly-conditional.rb

require 'rubygems'
require 'rest-open-uri'
uri = 'http://www.oreilly.com'

# Make an HTTP request and then describe the reponse.
def request(uri, *args)
begin
response = open(uri, *args)
rescue OpenURI::HTTPError => e
response = e.io
end

puts " Status code: #{response.status.inspect}"
puts " Representation size: #{response.size}"
last_modified = response.meta['last-modified']
etag = response.meta['etag']
puts " Last-modified: #{last_modified}"
puts = " Etag: #{etag}"
return last_modified, etag
end

puts "First request:"
last_modified, etag = request(uri)

puts "Second request:"
request(uri, 'If-modified-Since' => last_modified, 'If-none-match' => etag)

