# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resource do
    book
    sequence(:name) { |n| "resource#{n}" }
    format "pdf"
    file_size "10MB"
    links "tmux.pdf"
    user

    factory :invalid_resource do
      links nil
      book_id nil
    end
  end
end
