class Book < ActiveRecord::Base
  include Likeable
  # attributes
  attr_accessible :ISBN, :content, :name, :pages, :publishing_house, :tag_list, :author_list, :translator_list, :cover
  attr_accessor :tag_list, :author_list, :translator_list, :cover

  acts_as_taggable
  acts_as_taggable_on :tags, :authors, :translators

  # assocation
  belongs_to :user
  has_many :resources, :dependent => :destroy
  has_one :attachment, :as => :attachmenttable, :dependent => :destroy

  # validation
  validates :name, :uniqueness => true
  validates :name, :content, :tag_list, :presence => true
  validates :cover, :presence => true, :unless => :name

  # instance methods
  def cover_url
    attachment.try(:attachment).try(:url) || douban_img
  end

  class << self
    def generate(book_info)
      book = Book.new
      book.name = book_info[:title]
      book.ISBN = book_info[:isbn13]
      book.pages = book_info[:pages]
      book.publishing_house = book_info[:publisher]
      book.tag_list = book_info[:tags].join(',') if book_info[:tags]
      book.author_list = book_info[:author]
      book.translator_list = book_info[:translator]
      book.content = book_info[:summary]
      book.auto_create = true
      book.douban_img = book_info[:image_url].gsub('spic','mpic')
      book.save
      book
    end
  end
end
