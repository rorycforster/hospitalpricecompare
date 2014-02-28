FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    dob Date.today
    email { Faker::Internet.email } 
    password "rory"
    password_confirmation "rory"
  end
end