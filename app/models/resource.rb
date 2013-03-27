class Resource < ActiveRecord::Base
  attr_accessible :file_size, :format, :links, :name
  belongs_to :book
end
