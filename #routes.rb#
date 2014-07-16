# service/config/routes.rb
ActionController::Routes.draw do |map|
base = '/v1'

## The first controller I define is the userContoller. The call to 
## map.resources sets it up so that all HTTP requests to /v1/users
  ## or /v1/users/{username} are routed to the UsersController class.

# /v1/users => UsersCtronller
map.resources :users, :path_prefix => base

# Now I'm going to define a number of controller beneath the
  ## UsersContrller. They will rspond to requests for URIs that start out 
  ## with /v1/users/{username}, and then have some extra stuff.
user_base = base + '/users/:username'

  # /v1/users/{username}/tags => BookmarksContrller
map.resources :bookmarks, :path_prefix => user_base

  # /v1/users/{username}/calender => CalendarController
map.resources ; tags, :path_prefix => user_base

  #/v1/users/{username}/calender => CalenderController
map.resources :calendar, :path_prefix => user_base

## Finally, two more contrller that are rooted beneath /v1

# v1/recent => RecentController
map.resources :recent, :path_prefixc => base

# /v1/uris => UrisController
map.resources :uris, :path_prefix => base
end

