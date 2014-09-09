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
    cameron = User.create({
      :email => 'cameron@gmail.com',
      :first_name => 'Cameron',
      :last_name => 'Jacoby',
      :password => '123456',
      :password_confirmation => '123456'
    })
    cameron.price_queries.create({
      :start_latitude => 37.786958,
      :start_longitude => -122.394462,
      :end_latitude => 37.787933,
      :end_longitude => -122.4074981,
      :city => 'San Francisco',
      :nickname => 'GA to Union Square'
    })
    expect(cameron.price_queries.length).to eql(1)
  end

end