# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resource do
    book
    user

    factory :invalid_resource do
      book_id nil
    end
  end
end
