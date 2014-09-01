require 'rails_helper'

RSpec.describe PriceQuery, :type => :model do

  it "should create a new price query without saving to the database" do
    example_query_sf = PriceQuery.new({
      :start_latitude => 37.786958,
      :start_longitude => -122.394462,
      :end_latitude => 37.787933,
      :end_longitude => -122.4074981,
      :city => "San Francisco",
      :nickname => "GA to Union Square"
    })
    expect(example_query_sf.start_latitude).to eql(37.786958)
    expect(example_query_sf.start_longitude).to eql(-122.394462)
    expect(example_query_sf.end_latitude).to eql(37.787933)
    expect(example_query_sf.end_longitude).to eql(-122.4074981)
    expect(example_query_sf.city).to eql("San Francisco")
    expect(example_query_sf.nickname).to eql("GA to Union Square")
  end

  it "should save a new price query to the database" do
    example_query_sf = PriceQuery.new({
      :start_latitude => 37.786958,
      :start_longitude => -122.394462,
      :end_latitude => 37.787933,
      :end_longitude => -122.4074981,
      :city => "San Francisco",
      :nickname => "GA to Union Square"
    })
    expect(example_query_sf.new_record?).to eql(true)
    example_query_sf.save
    expect(example_query_sf.new_record?).to eql(false)
  end

	it "should create a new price query and save it to the database" do
		example_query_sf = PriceQuery.create({
			:start_latitude => 37.786958,
      :start_longitude => -122.394462,
      :end_latitude => 37.787933,
      :end_longitude => -122.4074981,
      :city => "San Francisco",
      :nickname => "GA to Union Square"
    })
		expect(example_query_sf).not_to eql(nil)
	end

  it "should validata presence and numbericality of start and end points" do
    example_query_sf = PriceQuery.create({
      :city => "San Francisco",
      :nickname => "GA to Union Square"
    })
    expect(example_query_sf.errors.size).to eql(8)
  end

  it "should validata that start and end points are within latitude/longitude range" do
    example_query_sf = PriceQuery.create({
      :start_latitude => 100,
      :start_longitude => -200,
      :end_latitude => -150,
      :end_longitude => 300,
      :city => "San Francisco",
      :nickname => "GA to Union Square"
    })
    expect(example_query_sf.errors.size).to eql(4)
  end

  it "should have many price results" do
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
    expect(example_query_sf.price_results.length).to eql(1)
  end

end