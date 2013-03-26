class Relationship < ActiveRecord::Base
  belongs_to :tag
  belongs_to :book
  belongs_to :author
  belongs_to :translator
  # attr_accessible :title, :body
end
