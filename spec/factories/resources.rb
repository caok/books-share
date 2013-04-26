# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resource do
    book
    name "Aglic Web Development with Rails"
    format "pdf"
    file_size "10MB"
    links "http://caok1231.com/blog/2013/04/14/tmux/"
    user
  end
end
