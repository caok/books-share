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
  end
end
