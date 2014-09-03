class SessionController < ApplicationController

  def new
  	#login form
  	if session[:user_id] != nil
  		redirect_to root_path
  	end
  end

  def create
  	# raise params.inspect
  	@user = User.authenticate(params[:user][:email], params[:user][:password])
  	# raise @user
  	if @user 
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		#add flash message here
  		redirect_to login_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	# add flash message here "logged out"
  	redirect_to login_path
  end
end
