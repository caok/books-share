## books-share [![Build Status](https://travis-ci.org/caok/books-share.png?branch=master)](https://travis-ci.org/caok/books-share)
This is the source code of [books-share](http://198.199.86.209:9000)

## Take a look
vps: http://book.nyepoch.com
<br/>
vps(ip): http://198.199.86.209:9000
<br/>
<最新代码> http://weidaxue.me:4000/

## Requirements

* Ruby 1.9.3
* MySQL
* rbenv
* sphinxsearch
* nodejs
* pdf2htmlEX

## development setup
* rename /config/databse.yml.example to /config/databse.yml
* sudo apt-get install sphinxsearch (mac: brew install sphinx --mysql )
* sudo apt-get install nodejs (mac: brew install node)
* rake db:setup
* rake ts:configure
* rake ts:index
* rake ts:start

## install pdf2htmlEx
* sudo apt-get install software-properties-common
* sudo add-apt-repository ppa:coolwanglu/pdf2htmlex
* sudo apt-get update
* sudo apt-get install pdf2htmlEX
* pdf2htmlEX -v


## Changed Log
06/11/2013 redeploy vps with the avatar uploaded<br/>
![avatar](https://f.cloud.github.com/assets/83296/636756/de67749a-d28f-11e2-92fd-0311b1a680de.png)

06/14/2013 add read online function<br/>
