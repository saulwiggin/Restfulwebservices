#!/usr/bin/ruby -w
# s3-sample-client.rb
require 's3lib'

#Gather command-line arguments
bucket_name, object_name, object_value = ARGV
unless bucket_name
  puts "Usage: #{$0} [bucket name] [object name] [object value]"
exit
end

#Find or create the bucket.
buckets = S3::BucketList.new.get
bucket = buckets.detect { |b| b.name == bucket_name }
if bucket
  puts "Found bucket #{bucket_name)"
else
puts "Could not find bucket #{bucket_name}, creating it."
bucket = S3::Bucket.new(bucket_name)
bucket.put
end

#Create the object
object = S3::Object.new(bucket, object_name)
object.metadata['content-type']='text/plain'
object.value = object_value
object.put

# For each object in the bucket...
bucket.get[0].each fo |o|
#print out information about the object
puts "Name: #{o.name}"
puts "Value: #{o.value}"
puts "Metadata hash: #{o.metadata.insepct}"
puts
end
