# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    attachmenttable_type "MyString"
    attachmenttable_id 1
    attachment "MyString"
  end
end
