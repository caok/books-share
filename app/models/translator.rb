class Translator < ActiveRecord::Base
  attr_accessible :name

  # validation
  validates :name, :presence => true
end
