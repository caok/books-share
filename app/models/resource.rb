# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Resource < ActiveRecord::Base
  attr_accessible :book_id, :file
  attr_accessor :file

  # assocation
  belongs_to :user
  belongs_to :book
  has_one :attachment, :as => :attachmenttable, :dependent => :destroy

  # validation
  validates :book_id, :presence => true
end
