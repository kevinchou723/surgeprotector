FactoryGirl.define do

  factory :price_query do 
    start_latitude Faker::Geolocation.lat
    start_longitude Faker::Geolocation.lng
    end_latitude Faker::Geolocation.lat
    end_longitude Faker::Geolocation.lng
    city 'San Francisco'
    nickname 'GA to Union Square'
    start_address '501 Folsom Street, San Francisco, CA'
  end

end