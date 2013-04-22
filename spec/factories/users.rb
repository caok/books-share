# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sample_login = ['jack', 'lucy', 'dave', 'lily', 'john', 'beth'].sample
  sequence(:name) { |n| "#{sample_login}#{n}" }
  sequence(:email) { |n| "#{sample_login}#{n}@example.com".downcase }

  factory :user do
    name
    email
    password ['DJX5nvyX', 'GG83Sr4{', '_pW.2P*8', 'MH^IN3B_'].sample
    password_confirmation { password }

    # create role user for all roles
    #   
    # trait :admin do
    #   roles ["admin"]
    # end
    #   
    # factory :admin_user, :traits => [:admin]
    User::ROLES.each do |r|
      trait r do
        roles r
      end

      factory "#{r}_user", :traits => [r]
    end
  end
end
