class Author < ActiveRecord::Base
  attr_accessible :name

  # validation
  validates :name, :presence => true
end
