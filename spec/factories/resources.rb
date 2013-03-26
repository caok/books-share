# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resource do
    book nil
    name "MyString"
    format "MyString"
    file_size "MyString"
    links "MyString"
  end
end
