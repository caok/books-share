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
  let(:resource) { build :resource }

  it "passes validation with all valid informations" do
    expect(resource).to be_valid
  end

  context "fails validation" do
    it "with a blank book" do
      resource.book_id = ''
      expect(resource.save).to be_false
    end
  end
end
