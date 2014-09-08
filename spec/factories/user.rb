# user.rb

FactoryGirl.define do
  # sequence :email do |n|
  #   "user_#{n}@factory.com"
  # end
  factory :user do
    email Faker::Internet.email
    first_name "Cameron"
    last_name "Jacoby"
    pswrd = Faker::Lorem.words(4).join("")
    password pswrd
    password_confirmation pswrd
  end
end