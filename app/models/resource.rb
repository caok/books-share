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
  attr_accessible :book_id, :file, :transformed
  attr_accessor :file

  # assocation
  belongs_to :user
  belongs_to :book
  has_one :attachment, :as => :attachmenttable, :dependent => :destroy

  # validation
  validates :book_id, :presence => true

  # instance methods
  def download_link
    try(:attachment).try(:attachment).try(:url) || ''
  end

  def pdf2html_link
    download_link.blank? ? '' : download_link.gsub(/.[pP][dD][fF]/, '.html')
  end

  def book_name
    try(:book).try(:name)
  end

  def post_by
    try(:user).try(:name)
  end
end
