require 'rails_helper'

RSpec.describe PriceResult, :type => :model do

  before(:each) do
    @example_query_sf = PriceQuery.create({
      :start_latitude => 37.786958,
      :start_longitude => -122.394462,
      :end_latitude => 37.787933,
      :end_longitude => -122.4074981,
      :city => 'San Francisco'
    })
    @example_price_result_sf = @example_query_sf.price_results.create({
      'localized_display_name'=>'uberX',
      'low_estimate'=>'5',
      'display_name'=>'uberX',
      'product_id'=>'a1111c8c-c720-46c3-8534-2fcdd730040d',
      'surge_multiplier'=>1.0,
      'estimate'=>'$5-7',
      'high_estimate'=>'7',
      'currency_code'=>'USD'
    })
  end

	it 'should save price result to the database and associate it with price query' do
    expect(@example_price_result_sf).not_to eql(nil)
  	expect(@example_query_sf.price_results).not_to eql(nil)
	end

  it 'should belong to price query' do
    expect(@example_price_result_sf.price_query).not_to eql(nil)
  end

end