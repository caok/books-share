class Tag < ActiveRecord::Base
  attr_accessible :name

  # assocation
  has_many :relationships
  has_many :books, :through => :relationships

  # validation
  validates :name, :presence => true
end
