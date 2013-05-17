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
