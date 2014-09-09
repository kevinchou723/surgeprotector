require 'rails_helper'

RSpec.describe User, :type => :model do
  subject {FactoryGirl.create(:user)}

  it "should have a valid factory" do
    expect(subject).to be_valid
  end

  it 'should validate presence of first and last name' do
    cameron = User.create({
      :email => 'cameron@gmail.com',
      :password => '123456',
      :password_confirmation => '123456'
    })
    expect(cameron.errors.size).to eql(2)
  end

  it 'should validate presence of email' do
    cameron = User.create({
      :first_name => 'Cameron',
      :last_name => 'Jacoby',
      :password => '123456',
      :password_confirmation => '123456'
    })
    expect(cameron.errors.size).to eql(2)
  end

  it 'should validate email format' do
    cameron = User.create({
      :email => 'cameron@gmail',
      :first_name => 'Cameron',
      :last_name => 'Jacoby',
      :password => '123456',
      :password_confirmation => '123456'
    })
    expect(cameron.errors.size).to eql(1)
  end

  it 'should validate password length' do
    cameron = User.create({
      :email => 'cameron@gmail.com',
      :first_name => 'Cameron',
      :last_name => 'Jacoby',
      :password => '123',
      :password_confirmation => '123'
    })
    expect(cameron.errors.size).to eql(1)
  end

  it 'should require password confirmation' do
    cameron = User.create({
      :email => 'cameron@gmail.com',
      :first_name => 'Cameron',
      :last_name => 'Jacoby',
      :password => '123456',
      :password_confirmation => '12345678'
    })
    expect(cameron.errors.size).to eql(2)
  end

  it 'should have many price queries' do
    price_query_1 = FactoryGirl.create(:price_query)
    price_query_2 = FactoryGirl.create(:price_query)
    subject.price_queries << [price_query_1, price_query_2]
    expect(subject.price_queries.length).to eql(2)
    expect(price_query_1.user).to eql(subject)
    expect(price_query_2.user).to eql(subject)
  end

end