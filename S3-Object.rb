#An S3 object, associated with a bucket, conatining a value abnd metadata.
class object
include Authorized

#The client can see which Bucket this Object is in.
attr_reader :bucket

# The client can read and write the name of this object.
attr_accessor :name

#The client can write this Object's metadata and value/.
#
