class Resource < ActiveRecord::Base
  attr_accessible :file_size, :format, :links, :name

  # assocation
  belongs_to :book

  # validation
  validates :name, :links, :presence => true
end
