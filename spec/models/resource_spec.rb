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

require 'spec_helper'

describe Resource do
  let(:book) { create :book }
  let(:user) { create :user }
  let(:resource) { create :resource, :user => user, :book => book }

  it "passes validation with all valid informations" do
    expect(resource).to be_valid
  end

  context "fails validation" do
    it "with a blank book" do
      resource.book_id = ''
      expect(resource.save).to be_false
    end
  end

  context "instance methods" do
    it "book_name" do
      resource.book_name.should eq book.name
    end

    it "post_by" do
      resource.post_by.should eq user.name
    end

    it "download_link" do
      #resource.download_link.should eq attachment.attachment.url
    end

    it "pdf2html_link" do
      resource.stub(:download_link) { "http://caok1231.com/attachment/18/AngularJS_Cheat_Sheet.pdf" }
      resource.pdf2html_link.should eq "http://caok1231.com/attachment/18/AngularJS_Cheat_Sheet.html"
    end
  end
end
