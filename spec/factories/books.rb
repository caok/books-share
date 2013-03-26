# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    name "MyString"
    publishing_house "MyString"
    pages 1
    ISBN "MyString"
    content "MyText"
  end
end
