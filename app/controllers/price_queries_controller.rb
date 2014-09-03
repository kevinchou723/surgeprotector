class PriceQueriesController < ApplicationController
  def new
  	@user = User.find_by_id(params[:user_id])
  	@price_query = @user.price_queries.new
  end

  def create
  	@user = User.find_by_id(parmas[:user_id])
  end

  def edit
  end

  def delete
  end
end
