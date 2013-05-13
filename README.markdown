## books-share [![Build Status](https://travis-ci.org/caok/books-share.png?branch=master)](https://travis-ci.org/caok/books-share)
This is the source code of [books-share](http://book-share.cloudfoundry.com).

## Take a look
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
