require 'rails_helper'

RSpec.describe PriceResult, :type => :model do
	it "should save results to the database and associate it with price query" do
		example_query_ga = PriceQuery.create({
			:start_latitude => 37.786958,
      :start_longitude => -122.394462,
      :end_latitude => 37.777034,
      :end_longitude => -122.4152628,
      :city => "San Francisco"
	})

	example_query_ga.price_results.create({
		"localized_display_name"=>"uberX", 
		"low_estimate"=>"6", 
		"display_name"=>"uberX", 
		"product_id"=>"a1111c8c-c720-46c3-8534-2fcdd730040d", 
		"surge_multiplier"=>1.0, 
		"estimate"=>"$6-8", 
		"high_estimate"=>"8", 
		"currency_code"=>"USD"})
	expect(example_query_ga.price_results).not_to eq(nil)

	end
end
