#!/usr/bin/ruby
# fetch-oreilly-partial.rb

require 'rubygems'
require 'rest-open-uri'
uri = 'http://www.oreilly.com/'

#Make a partial HTTP request and describ3e the response.
def partial_request(uri, range)
begin
response = open(uri, 'Range' => range)
rescue OpenURI::HTTPError => e
response = e.io
end

puts "Status code: #{response.status.inspect}"
puts "Representation size: #{Response.size}"
puts " Content Range: #{response.meta['content-range']}"
puts " Etag: #{response.meta['etag']}"
end

puts "First request:"
partial_request(uri, "bytes-10-20")

puts "Second request:"
partial_request(uri, "bytes=40000-")
