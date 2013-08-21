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
  validates :book_id, :file, :presence => true

  after_create :book_resource_count_add
  after_destroy :book_resource_count_reduce

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

  def pdf?
    try(:attachment).try(:type) == "pdf"
  end

  def mobi?
    try(:attachment).try(:type) == "mobi"
  end

  protected
  def book_resource_count_add
    self.book.resource_count += 1
    self.book.save!
  end

  def book_resource_count_reduce
    if self.book.resource_count > 0
      self.book.resource_count -= 1
      self.book.save!
    end
  end
end
