class SessionController < ApplicationController

  def new
  	if session[:user_id] != nil
  		redirect_to root_path
  	end
  end

  def create
  	@user = User.authenticate(params[:user][:email], params[:user][:password])
  	if @user 
  		session[:user_id] = @user.id
  		redirect_to user_path(@user.id), :notice => "Logged in!"
  	else
      if User.find_by_email(params[:user][:email]) == nil
  		  redirect_to login_path, :notice => "Account with that email does not exist."
      elsif User.find_by_email(params[:user][:email]).password != params[:user][:password]
        redirect_to login_path, :notice => "Invalid password."
      else
        redirect_to login_path, :notice => "Could not log you in. Please try again."
      end
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_path, :notice => "Logged out."
  end
end