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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    attachmenttable_type "MyString"
    attachmenttable_id 1
    attachment "book.jpg"
  end
end
