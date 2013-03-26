class Book < ActiveRecord::Base
  attr_accessible :ISBN, :content, :name, :pages, :publishing_house
end
