class Resource < ActiveRecord::Base
  belongs_to :book
  attr_accessible :file_size, :format, :links, :name
end
