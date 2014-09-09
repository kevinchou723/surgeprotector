require 'rails_helper'

RSpec.describe PriceQuery, :type => :model do

  subject {FactoryGirl.create(:price_query)}

  it 'should have a valid factory' do
    expect(subject).to be_valid
  end

  it 'should validate presence and numericality of start points' do
    example_query = PriceQuery.create({
      :city => 'San Francisco',
      :nickname => 'GA to Union Square'
    })
    expect(example_query.errors.size).to eql(4)
  end

  it 'should validate that start points are within latitude/longitude range' do
    example_query = PriceQuery.create({
      :start_latitude => 100,
      :start_longitude => -200,
      :city => 'San Francisco',
      :nickname => 'GA to Union Square'
    })
    expect(example_query.errors.size).to eql(2)
  end

  it 'should have many price results' do
    price_result_1 = FactoryGirl.create(:price_result)
    price_result_2 = FactoryGirl.create(:price_result)
    subject.price_results << [price_result_1, price_result_2]
    expect(subject.price_results.length).to eql(2)
    expect(price_result_1.price_query).to eql(subject)
    expect(price_result_2.price_query).to eql(subject)
  end

  it 'should belong to a user' do
    user_1 = FactoryGirl.create(:user)
    user_1.price_queries << subject
    expect(subject.user).to eql(user_1)
    expect(user_1.price_queries.length).to eql(1)
  end

end