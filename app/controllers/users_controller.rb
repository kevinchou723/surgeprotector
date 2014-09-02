class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    new_user = params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )

    @user = User.new(new_user)

    if @user.save
      redirect_to "/"
    else
      redirect_to "/signup"
    end
  end

  def show
    user_id = params[:id]
    @user = User.find_by_id(user_id)
    @price_queries = @user.price_queries
  end

  def edit
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end

  def update
    user_id = params[:id]
    @user = User.find_by_id(user_id)

    updated_user = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)

    @user.update_attributes(
      :first_name => updated_user[:first_name],
      :last_name  => updated_user[:last_name],
      :email      => updated_user[:email],
      :password   => updated_user[:password],
      :password_confirmation   => updated_user[:password_confirmation]
    )

    redirect_to user_path

  end

  def destroy
    user_id = params[:id]
    @user = User.find_by_id(user_id)
    @user.destroy
    redirect_to root_path
  end

end