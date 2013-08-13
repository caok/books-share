## books-share [![Build Status](https://travis-ci.org/caok/books-share.png?branch=master)](https://travis-ci.org/caok/books-share)
This is the source code of [books-share](http://198.199.86.209:9000)

## Take a look
vps: http://book.nyepoch.com
<br/>
vps(ip): http://198.199.86.209:9000
<br/>
<最新代码> http://tao.weidaxue.me

## Requirements

* Ruby 1.9.3
* MySQL
* rbenv
* sphinxsearch
* nodejs
* pdf2htmlEX

## development setup
* rename /config/database.yml.example to /config/database.yml
* rename /config/application.yml.example to /config/application.yml
* rake secret
* sudo apt-get install sphinxsearch (mac: brew install sphinx --mysql )
* sudo apt-get install nodejs (mac: brew install node)
* rake db:setup
* rake ts:configure
* rake ts:index
* rake ts:start
* RAILS_ENV=development script/delayed_job start


## install pdf2htmlEx
* sudo apt-get install software-properties-common
* sudo add-apt-repository ppa:coolwanglu/pdf2htmlex
* sudo apt-get update
* sudo apt-get install pdf2htmlEX
* pdf2htmlEX -v


## Changed Log
* 06/11/2013 redeploy vps with the avatar uploaded<br/>
* 06/14/2013 add read online function<br/>
* 08/12/2013 add delayed_job for sending_to_kindle<br/>
