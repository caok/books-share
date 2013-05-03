# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    sequence(:name) { |n| "book#{n}" }
    cover "cover_url"
    tag_list "rails,ruby"
    author_list "Brad,Ediger"
    translator_list "UI Team"
    publishing_house "DHH"
    pages 500
    ISBN "978-7-121-11096-2"
    content "MyText"
    user

    factory :invalid_book do
      name nil
      tag_list nil
      content nil
    end
  end
end
