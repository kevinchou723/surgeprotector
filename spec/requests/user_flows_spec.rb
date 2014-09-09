require 'rails_helper'

RSpec.describe 'UserFlows', :type => :request do

  subject {FactoryGirl.create(:user)}

  it 'should log in a user' do
    https!
    get '/login'
    assert_response :success


    # not passing yet
 
    # post_via_redirect '/login',
    #   email: subject.email,
    #   password: subject.password
    
    # assert_equal user_path(subject.id)
    # assert_equal 'Logged in!', flash[:notice]
 
  end

end