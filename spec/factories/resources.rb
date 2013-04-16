# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resource do
    book_id 1
    name "Aglic Web Development with Rails"
    format "pdf"
    file_size "10MB"
    links "http://caok1231.com/blog/2013/04/14/tmux/"
  end
end
