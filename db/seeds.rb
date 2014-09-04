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
	"low_estimate"=>"5",
	"display_name"=>"uberX",
	"product_id"=>"a1111c8c-c720-46c3-8534-2fcdd730040d",
	"surge_multiplier"=>1.0,
	"estimate"=>"$5-7",
	"high_estimate"=>"7",
	"currency_code"=>"USD"
})

example_query_sf.price_results.create({
	"localized_display_name"=>"uberXL",
	"low_estimate"=>"9",
	"display_name"=>"uberXL",
	"product_id"=>"821415d8-3bd5-4e27-9604-194e4359a449",
	"surge_multiplier"=>1.0,
	"estimate"=>"$9-12",
	"high_estimate"=>"12",
	"currency_code"=>"USD"
})

example_query_sf.price_results.create({
	"localized_display_name"=>"UberBLACK",
	"low_estimate"=>"15",
	"display_name"=>"UberBLACK",
	"product_id"=>"d4abaae7-f4d6-4152-91cc-77523e8165a4",
	"surge_multiplier"=>1.0,
	"estimate"=>"$15-17",
	"high_estimate"=>"17",
	"currency_code"=>"USD"
})

example_query_sf.price_results.create({
	"localized_display_name"=>"UberSUV",
	"low_estimate"=>"25",
	"display_name"=>"UberSUV",
	"product_id"=>"8920cb5e-51a4-4fa4-acdf-dd86c5e18ae0",
	"surge_multiplier"=>1.0,
	"estimate"=>"$25",
	"high_estimate"=>"25",
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

example_query_nyc.price_results.create({
	"localized_display_name"=>"uberX",
	"low_estimate"=>"8",
	"display_name"=>"uberX",
	"product_id"=>"b8e5c464-5de2-4539-a35a-986d6e58f186",
	"surge_multiplier"=>1.0,
	"estimate"=>"$8-10",
	"high_estimate"=>"10",
	"currency_code"=>"USD"
})

example_query_nyc.price_results.create({
	"localized_display_name"=>"uberXL",
	"low_estimate"=>"12",
	"display_name"=>"uberXL",
	"product_id"=>"1e0ce2df-4a1e-4333-86dd-dc0c67aaabe1",
	"surge_multiplier"=>1.0,
	"estimate"=>"$12-15",
	"high_estimate"=>"15",
	"currency_code"=>"USD"
})

example_query_nyc.price_results.create({
	"localized_display_name"=>"UberBLACK",
	"low_estimate"=>"15",
	"display_name"=>"UberBLACK",
	"product_id"=>"0e9d8dd3-ffec-4c2b-9714-537e6174bb88",
	"surge_multiplier"=>1.0,
	"estimate"=>"$15-17",
	"high_estimate"=>"17",
	"currency_code"=>"USD"
})

example_query_nyc.price_results.create({
	"localized_display_name"=>"UberSUV",
	"low_estimate"=>"25",
	"display_name"=>"UberSUV",
	"product_id"=>"56487469-0d3d-4f19-b662-234b7576a562",
	"surge_multiplier"=>1.0,
	"estimate"=>"$25-26",
	"high_estimate"=>"26",
	"currency_code"=>"USD"
})

example_query_nyc.price_results.create({
	"localized_display_name"=>"uberT",
	"low_estimate"=>nil,
	"display_name"=>"uberT",
	"product_id"=>"ebe413ab-cf49-465f-8564-a71119bfa449",
	"surge_multiplier"=>1,
	"estimate"=>"Metered",
	"high_estimate"=>nil,
	"currency_code"=>nil
})

example_query_la = PriceQuery.create({
	:start_latitude => 34.0129821,
  :start_longitude => -118.495196,
  :end_latitude => 34.071942,
  :end_longitude => -118.357218,
  :city => "Los Angeles",
  :nickname => "GA to The Grove"
})

example_query_la.price_results.create({
	"localized_display_name"=>"uberX",
	"low_estimate"=>"16",
	"display_name"=>"uberX",
	"product_id"=>"2143f90b-ce68-4f6d-a113-4872b207e626",
	"surge_multiplier"=>1.0,
	"estimate"=>"$16-21",
	"high_estimate"=>"21",
	"currency_code"=>"USD"
})

example_query_la.price_results.create({
	"localized_display_name"=>"uberXL",
	"low_estimate"=>"27",
	"display_name"=>"uberXL",
	"product_id"=>"9502f87d-e0d0-488d-b84f-b8537538c339",
	"surge_multiplier"=>1.0,
	"estimate"=>"$27-36",
	"high_estimate"=>"36",
	"currency_code"=>"USD"
})

example_query_la.price_results.create({
	"localized_display_name"=>"UberBLACK",
	"low_estimate"=>"50",
	"display_name"=>"UberBLACK",
	"product_id"=>"e4578b16-6714-4cba-a131-f8cb56ad4555",
	"surge_multiplier"=>1.0,
	"estimate"=>"$50-65",
	"high_estimate"=>"65",
	"currency_code"=>"USD"
})

example_query_la.price_results.create({
	"localized_display_name"=>"UberSUV",
	"low_estimate"=>"65",
	"display_name"=>"UberSUV",
	"product_id"=>"16ecc8ec-7fe5-4c5f-9c68-ff9c696f7d5f",
	"surge_multiplier"=>1.0,
	"estimate"=>"$65-82",
	"high_estimate"=>"82",
	"currency_code"=>"USD"
})

example_query_sea = PriceQuery.create({
	:start_latitude => 47.6233544,
  :start_longitude => -122.3301121,
  :end_latitude => 47.620506,
  :end_longitude => -122.349277,
  :city => "Seattle",
  :nickname => "GA to Space Needle"
})

example_query_sea.price_results.create({
	"localized_display_name"=>"uberX",
	"low_estimate"=>"5",
	"display_name"=>"uberX",
	"product_id"=>"6450cc0f-4d39-4473-8632-1e2c2049fefe",
	"surge_multiplier"=>1.0,
	"estimate"=>"$5-6",
	"high_estimate"=>"6",
	"currency_code"=>"USD"
})

example_query_sea.price_results.create({
	"localized_display_name"=>"uberXL",
	"low_estimate"=>"8",
	"display_name"=>"uberXL",
	"product_id"=>"46c40aaf-e282-425a-8b46-b0a19344bb58",
	"surge_multiplier"=>1.0,
	"estimate"=>"$8-11",
	"high_estimate"=>"11",
	"currency_code"=>"USD"
})

example_query_sea.price_results.create({
	"localized_display_name"=>"UberBLACK",
	"low_estimate"=>"13",
	"display_name"=>"UberBLACK",
	"product_id"=>"aaa58858-2747-4170-ac8b-9b2839ff6d45",
	"surge_multiplier"=>1.0,
	"estimate"=>"$13-15",
	"high_estimate"=>"15",
	"currency_code"=>"USD"
})

example_query_sea.price_results.create({
	"localized_display_name"=>"UberSUV",
	"low_estimate"=>"20",
	"display_name"=>"UberSUV",
	"product_id"=>"2928cf1c-a17d-4fcb-b7e8-8fd91dbfa1d9",
	"surge_multiplier"=>1.0,
	"estimate"=>"$20-23",
	"high_estimate"=>"23",
	"currency_code"=>"USD"
})

# International Price Queries

example_query_london = PriceQuery.create({
	:start_latitude => 51.5286416,
	:start_longitude => -0.1015987,
	:end_latitude => 51.522532,
	:end_longitude => -0.109437,
	:city => "London",
	:nickname => "London to GA campus"
})

example_query_hk = PriceQuery.create({
	:start_latitude => 22.3700555,
	:start_longitude => 114.1535941,
	:end_latitude => 22.2830469,
	:end_longitude => 114.1570795,
	:city => "Hong Kong",
	:nickname => "Hong Kong to GA campus"
})

example_query_melbourne = PriceQuery.create({
	:start_latitude => -37.8602828,
	:start_longitude => 145.079616,
	:end_latitude => -37.8182661,
	:end_longitude => 144.9623883,
	:city => "Melbourne",
	:nickname => "Melbourne to GA campus"
})

example_query_sydney = PriceQuery.create({
	:start_latitude => -33.7969235,
	:start_longitude => 150.9224326,
	:end_latitude => -33.869824,
	:end_longitude => 151.206423,
	:city => "Sydney",
	:nickname => "Sydney to GA campus"
})