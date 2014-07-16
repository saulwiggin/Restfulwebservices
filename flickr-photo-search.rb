#!usr/bin/ruby -w
# flickr-photo-search.rb
require 'open-uri'
require 'rexml/document'

#returns the URI to a small version of a flickr photo
def small_photo_uri(photo)
	server = photo.attribute('server')
	id = photo.attribute('id')
	secret = photo.attribute('secret')
	return "http://static.flickr.com/#{server}/#{id}_#{secret}_m.jpg"
end

#Searches Flickr for photos matching a certain tag, and prints a URI# for each search result.
def print_each_photo(api_key,tag)
#build the URI#
	uri = "http://www.flickr.com/services/rest?method=flickr.photos.search" +
	"&api_key=#(api_key)&tags=#{tag}"
	
	#make the HTTP request and get the entity-body.
	response = open(uri).read
	
	#Parse THE ENTITY-BODY AS AN xml DOCUMENT
	doc = REXML::Document.new(response)
	
	# For each photo found...
	REXML::XPath.each(doc, '//photo') fo |photo|
	#...generate and print its URI
	puts small_photo_uri(photo) if photo
	end
	end
	# Main Program #
	if ARGV.size < 2
		puts "Usage: #{$o} {Flickr API key] [search term]"
		exit 
		end
		
		api_key, tag = ARGV
		print_each_photo(api_key,tag)
		
		