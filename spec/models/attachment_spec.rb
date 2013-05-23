# == Schema Information
#
# Table name: attachments
#
#  id                   :integer          not null, primary key
#  attachmenttable_type :string(255)
#  attachmenttable_id   :integer
#  attachment           :string(255)
#  file_name            :string(255)
#  file_size            :string(255)
#  file_type            :string(255)
#

require 'spec_helper'

describe Attachment do
  #let(:attachment) { build :attachment }

  #it "passes validation with all valid informations" do
    #expect(attachment).to be_valid
  #end

  #context "fails validation" do
    #it "with a blank name" do
      #attachment.attachment = nil
      #expect(attachment.save).to be_false
    #end

    #it "with a blank book" do
      #attachment.attachmenttable = nil
      #expect(attachment.save).to be_false
    #end
  #end
end
