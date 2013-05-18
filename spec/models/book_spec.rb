require 'spec_helper'

describe Book do
  let(:book) { build :book }

  it "passes validation with all valid informations" do
    expect(book).to be_valid
  end

  context "fails validation" do
    it "with a blank name" do
      book.name = ''
      expect(book.save).to be_false
    end

    it "with a duplicated name" do
      create :book, :name => book.name
      expect(book.save).to be_false
    end

    it "with a blank tag_list" do
      book.tag_list = ''
      expect(book.save).to be_false
    end

    it "with a blank content" do
      book.content = ''
      expect(book.save).to be_false
    end
  end

  it "cover_url" do
    book.attachment = Attachment.create
    book.save
    book.cover_url.should eq book.attachment.attachment.url
  end

  it 'when cover_url is nil , can use douban_img' do
    book.douban_img = 'http://img3.douban.com/mpic/s24963634.jpg'
    book.attachment = nil
    book.cover_url.should eq book.douban_img
  end

  it 'generate book with douban book info ' do
    lambda { Book.generate(Mini::Douban.book_api :id=>'21382184') }.should change(Book, :count).by(1)
  end
end
