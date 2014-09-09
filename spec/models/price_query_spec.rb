require 'rails_helper'

RSpec.describe PriceQuery, :type => :model do

  subject {FactoryGirl.create(:price_query)}

  it 'should have a valid factory' do
    expect(subject).to be_valid
  end

  it 'should validate presence and numbericality of start points' do
    example_query_sf = PriceQuery.create({
      :city => 'San Francisco',
      :nickname => 'GA to Union Square'
    })
    expect(example_query_sf.errors.size).to eql(4)
  end

  it 'should validate that start points are within latitude/longitude range' do
    example_query_sf = PriceQuery.create({
      :start_latitude => 100,
      :start_longitude => -200,
      :end_latitude => -150,
      :end_longitude => 300,
      :city => 'San Francisco',
      :nickname => 'GA to Union Square'
    })
    expect(example_query_sf.errors.size).to eql(2)
  end

  it 'should have many price results' do
    example_query_sf = PriceQuery.create({
      :start_latitude => 37.786958,
      :start_longitude => -122.394462,
      :end_latitude => 37.787933,
      :end_longitude => -122.4074981,
      :city => 'San Francisco',
      :nickname => 'GA to Union Square'
    })
    example_query_sf.price_results.create({
      'localized_display_name'=>'uberX',
      'low_estimate'=>'5',
      'display_name'=>'uberX',
      'product_id'=>'a1111c8c-c720-46c3-8534-2fcdd730040d',
      'surge_multiplier'=>1.0,
      'estimate'=>'$5-7',
      'high_estimate'=>'7',
      'currency_code'=>'USD'
    })
    expect(example_query_sf.price_results.length).to eql(1)
  end

  it 'should associate price query with a user' do
    cameron = User.create({
      :email => 'cameron@gmail.com',
      :first_name => 'Cameron',
      :last_name => 'Jacoby',
      :password => '123456',
      :password_confirmation => '123456'
    })
    example_query_sf = cameron.price_queries.create({
      :start_latitude => 37.786958,
      :start_longitude => -122.394462,
      :end_latitude => 37.787933,
      :end_longitude => -122.4074981,
      :city => 'San Francisco',
      :nickname => 'GA to Union Square'
    })
    expect(cameron.price_queries.length).to eql(1)
  end

  it 'should belong to a user' do
    cameron = User.create({
      :email => 'cameron@gmail.com',
      :first_name => 'Cameron',
      :last_name => 'Jacoby',
      :password => '123456',
      :password_confirmation => '123456'
    })
    example_query_sf = cameron.price_queries.create({
      :start_latitude => 37.786958,
      :start_longitude => -122.394462,
      :end_latitude => 37.787933,
      :end_longitude => -122.4074981,
      :city => 'San Francisco',
      :nickname => 'GA to Union Square'
    })
    expect(example_query_sf.user).to eql(cameron)
  end

end