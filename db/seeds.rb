# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

example_query_sf = PriceQuery.create({
	:start_latitude => 37.786958,
  :start_longitude => -122.394462,
  :end_latitude => 37.787933,
  :end_longitude => -122.4074981,
  :city => "San Francisco",
  :nickname => "GA to Union Square"
})

example_query_sf.price_results.create({
	"localized_display_name"=>"uberX", 
	"low_estimate"=>"6", 
	"display_name"=>"uberX", 
	"product_id"=>"a1111c8c-c720-46c3-8534-2fcdd730040d", 
	"surge_multiplier"=>1.0, 
	"estimate"=>"$6-8", 
	"high_estimate"=>"8", 
	"currency_code"=>"USD"
})

example_query_sf.price_results.create({
	"localized_display_name"=>"uberXL", 
	"low_estimate"=>"11", 
	"display_name"=>"uberXL", 
	"product_id"=>"821415d8-3bd5-4e27-9604-194e4359a449", 
	"surge_multiplier"=>1.0, 
	"estimate"=>"$11-14", 
	"high_estimate"=>"14", 
	"currency_code"=>"USD"
})

example_query_sf.price_results.create({
	"localized_display_name"=>"UberBLACK", 
	"low_estimate"=>"17", 
	"display_name"=>"UberBLACK", 
	"product_id"=>"d4abaae7-f4d6-4152-91cc-77523e8165a4", 
	"surge_multiplier"=>1.0, 
	"estimate"=>"$17-21", 
	"high_estimate"=>"21", 
	"currency_code"=>"USD"
}) 

example_query_sf.price_results.create({
	"localized_display_name"=>"UberSUV", 
	"low_estimate"=>"25", 
	"display_name"=>"UberSUV", 
	"product_id"=>"8920cb5e-51a4-4fa4-acdf-dd86c5e18ae0", 
	"surge_multiplier"=>1.0, 
	"estimate"=>"$25-29", 
	"high_estimate"=>"29", 
	"currency_code"=>"USD"
})

example_query_sf.price_results.create({
	"localized_display_name"=>"uberTAXI", 
	"low_estimate"=>nil, 
	"display_name"=>"uberTAXI", 
	"product_id"=>"3ab64887-4842-4c8e-9780-ccecd3a0391d", 
	"surge_multiplier"=>1, 
	"estimate"=>"Metered", 
	"high_estimate"=>nil, 
	"currency_code"=>nil
})

example_query_nyc = PriceQuery.create({
	:start_latitude => 40.739884,
  :start_longitude => -73.9900754,
  :end_latitude => 40.74844,
  :end_longitude => -73.985664,
  :city => "New York",
  :nickname => "GA to Empire State Building"
})

example_query_la = PriceQuery.create({
	:start_latitude => 34.0129821,
  :start_longitude => -118.495196,
  :end_latitude => 34.071942,
  :end_longitude => -118.357218,
  :city => "Los Angeles",
  :nickname => "GA to The Grove"
})

example_query_sea = PriceQuery.create({
	:start_latitude => 47.6233544,
  :start_longitude => -122.3301121,
  :end_latitude => 47.620506,
  :end_longitude => -122.349277,
  :city => "Seattle",
  :nickname => "GA to Space Needle"
})