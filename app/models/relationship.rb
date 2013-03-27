class Relationship < ActiveRecord::Base
  # assocation
  belongs_to :tag
  belongs_to :book
  belongs_to :author
  belongs_to :translator
end
