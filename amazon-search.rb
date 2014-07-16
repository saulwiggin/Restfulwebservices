#!/usr/bin/ruby -w
# amazon-book-search.rb
require 'amazon/search'

if ARGV.size != 2
	puts "Usage: #{$0} [Amazon Web Service AccessKey ID] [text to search for]"
	exit
end
access_key, search_request = ARGVreq = Amazon::Search::Request.new(access_key)
#for every book in the search results...
req.keyword_search(search_request, 'books',Amazon::Search::LIGHT) do |book|
#print the book's name and the list of authors
	puts %{"#{book.product_name}" by #{book.authors.join(',')}}
end