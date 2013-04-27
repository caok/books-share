class Resource < ActiveRecord::Base
  attr_accessible :file_size, :format, :links, :name, :book_id, :user

  # assocation
  belongs_to :user
  belongs_to :book

  # validation
  validates :name, :links, :book_id, :presence => true
end
