# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    name "Aglic Web Development with Rails"
    cover "cover_url"
    tag_list "rails,ruby"
    author_list "Brad,Ediger"
    translator_list "UI Team"
    publishing_house "DHH"
    pages 500
    ISBN "978-7-121-11096-2"
    content "MyText"
  end
end
