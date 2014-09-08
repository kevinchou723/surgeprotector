# user.rb

FactoryGirl.define do
  sequence :email do |n|
    "user_#{n}@factory.com"
  end

  factory :user do
    email 
    first_name "Cameron"
    last_name "Jacoby"
    pswrd = "blahblah"
    password pswrd
    password_confirmation pswrd
  end
end