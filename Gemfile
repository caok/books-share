#source 'https://rubygems.org'
source 'http://ruby.taobao.org/'

gem 'rails', '3.2.12'
gem 'mysql2'
gem 'slim-rails'
gem 'kaminari'
gem 'nokogiri'
gem 'simple_form'
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
gem 'devise'
gem 'cancan'
# attachment
gem 'carrierwave'
gem 'mini_magick'
# tag
gem 'acts-as-taggable-on'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'jquery-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'turbo-sprockets-rails3'
  gem 'bootstrap-sass'
  gem 'therubyracer', :platforms => :ruby #Recommended to install Node.js, without therubyracer
end

group :development do
  gem 'thin'
  gem 'pry-nav'
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
end

group :test do
  gem 'capybara'
  gem 'simplecov', :require => false
end

group :production do
  gem 'exception_notification'
  gem 'unicorn', :platforms => :ruby
end
