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
    price_result = PriceResult.create({
      :localized_display_name => 'uberX',
      :low_estimate =>'5',
      :display_name =>'uberX',
      :product_id =>'a1111c8c-c720-46c3-8534-2fcdd730040d',
      :surge_multiplier =>1.0,
      :estimate =>'$5-7',
      :high_estimate =>'7',
      :currency_code =>'USD'
    })
    subject.price_results << price_result
    expect(subject.price_results.length).to eql(1)
  end

  it 'should belong to a user' do
    cameron = User.create({
      :email => 'cameron@gmail.com',
      :first_name => 'Cameron',
      :last_name => 'Jacoby',
      :password => '123456',
      :password_confirmation => '123456'
    })
    cameron.price_queries << subject
    expect(cameron.price_queries.length).to eql(1)
    expect(subject.user).to eql(cameron)
  end

end