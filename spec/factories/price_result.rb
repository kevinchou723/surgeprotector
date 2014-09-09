FactoryGirl.define do

  factory :price_result do
    localized_display_name 'uberX'
    low_estimate '5'
    display_name 'uberX'
    product_id 'a1111c8c-c720-46c3-8534-2fcdd730040d'
    surge_multiplier 1.0
    estimate '$5-7'
    high_estimate '7'
    currency_code 'USD'
  end

end