#!/usr/bin/ruby
# delicious-wadl-ruby.rb
require 'wadl'

if ARGV.size !=2
  puts "Usage: #{$0} [username] [password]"
exit
end
username, password = ARGV

#Load an application from the WADL file
delicious = WADL::Application.from_wadl(open("delicious.wadl"))

#Give authentication infroamtion to the application
service = delicious.v1.with_baic_auth(username, password)

begin
# Find the "recent posts" functionality
recent_posts = service.posts.recent

# For every recebnt post ...
recent_posts.get.representation.each_by_param('post') do |post|
# Print its description and URI
    puts "#{post.attributes['description']}: #{post.attributes['href']}"
end
rescue WADL::Faults::AuthorizationRequired
puts "Invalid autheication infromation!"
end
