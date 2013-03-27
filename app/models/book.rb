class Book < ActiveRecord::Base
  # attributes
  attr_accessible :ISBN, :content, :name, :pages, :publishing_house, :tag, :author, :translator
  attr_accessor :tag, :author, :translator

  # assocation
  has_many :relationships
  has_many :tags, :through => :relationships
  has_many :authors, :through => :relationships
  has_many :translators, :through => :relationships
  has_many :resources, :dependent => :destroy

  # callback functions
  before_save :separate_labels
  def separate_labels
    tag.split(',').each { |label|
      tag = Tag.find_or_initialize_by_name(label)
      self.tags << tag unless self.tags.any? { |t| t == tag }
    }
    author.split(',').each { |label|
      author = Author.find_or_initialize_by_name(label)
      self.authors << author unless self.authors.any? { |a| a == author }
    }
    translator.split(',').each { |label|
      translator = Translator.find_or_initialize_by_name(label)
      self.translators << translator unless self.translators.any? { |t| t == translator }
    }
  end
  private :separate_labels

  # instance methods
  def tag_labels
    tags.map(&:name).join(', ')
  end

  def author_labels
    authors.map(&:name).join(' / ')
  end

  def translator_labels
    translators.map(&:name).join(' / ')
  end
end
