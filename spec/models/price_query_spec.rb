require 'rails_helper'

RSpec.describe PriceQuery, :type => :model do
	it "should save a price query to the database" do
		example_query_sf = PriceQuery.create({
			:start_latitude => 37.786958,
      :start_longitude => -122.394462,
      :end_latitude => 37.787933,
      :end_longitude => -122.4074981,
      :city => "San Francisco"
	})
		expect(example_query_sf).not_to eq(nil)
	end
end