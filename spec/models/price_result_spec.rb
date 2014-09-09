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
    price_query_1 = FactoryGirl.create(:price_query)
    price_query_1.price_results << subject
    expect(subject.price_query).to eql(price_query_1)
    expect(price_query_1.price_results.length).to eql(1)
  end

end