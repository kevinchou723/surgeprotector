class UsersController < ApplicationController

  before_action :is_authenticated?, except: [:new, :create]

  def new
    if session[:user_id] != nil
      redirect_to user_path(current_user.id)
    else
      @user = User.new
    end
  end

  def create
    if session[:user_id] == nil
      new_user = params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation
      )
      @user = User.new(new_user)
      if @user.save
        auth_user = User.authenticate(@user.email, @user.password)
        if auth_user
          session[:user_id] = @user.id
          redirect_to user_path(@user.id), :notice => 'Profile created!'
        end
      else
        if User.find_by_email(@user.email)
          redirect_to signup_path, :notice => 'An account with that email already exists.'
        elsif @user.password.length < 6
          redirect_to signup_path, :notice => 'Password must be at least 6 characters.'
        elsif @user.password != @user.password_confirmation
          redirect_to signup_path, :notice => 'Passwords must match.'
        end
      end
    else
      session[:user_id] = nil
      redirect_to login_path, :notice => 'Please re-login.'
    end
  end

  def show
    if User.find(params[:id]) != @current_user
      redirect_to user_path(@current_user.id)
    else
      @user = current_user
      @price_queries = @user.price_queries
    end
  end

  def edit
    if User.find(params[:id]) != @current_user
      redirect_to edit_user_path(@current_user.id)
    else
      @user = current_user
    end
  end

  def update
    if User.find(params[:id]) == current_user
      @user = current_user
      updated_user = params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation
      )
      @user.update_attributes(
        :first_name => updated_user[:first_name],
        :last_name  => updated_user[:last_name],
        :email      => updated_user[:email],
        :password   => updated_user[:password],
        :password_confirmation   => updated_user[:password_confirmation]
      )
      redirect_to user_path, :notice => 'Profile updated!'
    else
      session[:user_id] = nil
      redirect_to login_path, :notice => 'Please re-login.'
    end
  end

  def destroy
    if User.find(params[:id]) == current_user
      @user = current_user
      @user.destroy
      session[:user_id] = nil
      redirect_to root_path, :notice => 'Profile deleted.'
    else
      session[:user_id] = nil
      redirect_to login_path, :notice => 'Please re-login.'
    end
  end

end