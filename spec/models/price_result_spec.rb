require 'rails_helper'

RSpec.describe PriceResult, :type => :model do

  subject {FactoryGirl.create(:price_result)}

  it 'should have a valid factory' do
    expect(subject).to be_valid
  end

  it 'should have a time created at in UTC' do
    expect(subject.created_at).not_to eql(nil)
  end

  it 'should belong to a price query' do
    @example_query = PriceQuery.create({
      :start_latitude => 37.786958,
      :start_longitude => -122.394462,
      :end_latitude => 37.787933,
      :end_longitude => -122.4074981,
      :city => 'San Francisco',
      :nickname => 'GA to Union Square',
      :start_address => '501 Folsom Street, San Francisco, CA'
    })
    @example_query.price_results << subject
    expect(@example_query.price_results.length).to eql(1)
    expect(subject.price_query).to eql(@example_query)
  end

end