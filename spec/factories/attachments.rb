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
    attachmenttable_type "Resource"
    attachmenttable_id 1
    attachment "book.jpg"
    file_name "mybook"
    file_size "10Mb"
    file_type "application/pdf"
  end
end
