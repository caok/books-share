source 'https://rubygems.org'
#source 'http://ruby.taobao.org/'

gem 'rails', '3.2.12'
gem 'mysql2', "~> 0.3.12b6"
gem 'slim-rails'
gem 'kaminari'
gem 'nokogiri'
gem 'simple_form'
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
gem 'devise'
gem 'cancan'
gem 'acts_as_follower'
# attachment
gem 'carrierwave'
gem 'mini_magick'
#gem 'mime-types'
# tag
gem 'acts-as-taggable-on'
# fulltext search
gem 'thinking-sphinx'
# douban book api
gem "mini-douban", "~> 0.0.5"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'jquery-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'turbo-sprockets-rails3'
  gem 'bootstrap-sass'
  #gem 'therubyracer', :platforms => :ruby #Recommended to install Node.js, without therubyracer
end

group :development do
  gem 'thin'
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-stack_explorer'
  gem 'pry-debugger'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'capistrano'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'jasmine'
  gem 'factory_girl_rails'
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
end

group :test do
  gem 'capybara'
  gem 'simplecov', require: false
end

group :production do
  #gem 'pg'
  gem 'exception_notification'
  gem 'unicorn', :platforms => :ruby
end
