# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

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
