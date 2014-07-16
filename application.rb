# This method renders a list of bookmarks as a view in RSS, Atom, or Acti# veRecord XML format. It's called by show_bookmarks
# above, which is used by three controllers. It's also used
# seperately by UriController and BookmarksController.

#This view method supports conditional HTTP GET.
def render_bookmarks(bookmarks, title, feed_uri, user, except=[])
#Figure out a current value for the Last-Modified header.
if bookmarks.empty?
last_modified = nil
else
#Last-modified is the most recent timestamp in the bookmark list. 
most_most_recent_bookmark = bookmarks.max do |b1,b2|
b1.timestamp <=> b2.timestamp
end
last_modified = most_recent_bookmark.timestamp
end

# If the client requested XML, serialize the ActiveRecrod
# objects to XML. Include references to the tags in the 
# serialization.
format.xml { render :xml =>
bookmarks.to_xml(:except => except + [:id, :user_id],
                 :include => [:tags]) }
# If the client requested Atom, turn the ActiveRecord objects
# into an Atom feed.
format.atom { render :xml => atom_feed_for(bookmarks, title,
                                           feed_uri, user) }
end
end
end
