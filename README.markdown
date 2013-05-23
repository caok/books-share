## books-share [![Build Status](https://travis-ci.org/caok/books-share.png?branch=master)](https://travis-ci.org/caok/books-share)
This is the source code of [books-share](http://book-share.cloudfoundry.com).

## Take a look
vps: http://book.nyepoch.com
<br/>
vps(ip): http://198.199.86.209:9000
<br/>
cloudfoundry: http://book-share.cloudfoundry.com

## Requirements

* Ruby 1.9.3
* MySQL
* rbenv
* sphinxsearch
* nodejs

## development setup
* sudo apt-get install sphinxsearch
* sudo apt-get install nodejs
* rake db:setup
* rake ts:configure
* rake ts:index
* rake ts:start

## likeable & redis howto

super easy to use likeable and redis
<br/>
ubuntu install
```
  sudo aptitude install redis-server
```

How to use likeable

```ruby
Likeable.setup do |likeable|
  likeable.redis  = Redis.new
end
```
other useage:

```ruby
class Comment
  include Likeable

  # ...
end

class User
  include Likeable::UserMethods

  # ...
end

Likeable.setup do |likeable|
  likeable.redis   = Redis.new
end

comment = Comment.find(15)
comment.like_count                  # => 0
current_user.like!(comment)         # => #<Likeable::Like ... >
comment.like_count                  # => 1
comment.likes                       # => [#<Likeable::Like ... >]
comment.likes.last.user             # => #<User ... >
comment.likes.last.created_at       # => Wed Jul 27 19:34:32 -0500 2011

comment.liked_by?(current_user)     # => true

current_user.all_liked(Comment)     # => [#<Comment ...>, ...]

liked_comment = Likeable.find_by_resource_id("Comment", 15)
liked_comment == comment
```
