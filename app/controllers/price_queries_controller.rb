class PriceQueriesController < ApplicationController

  before_action :is_authenticated?
  
  def new
  	@user = User.find_by_id(params[:user_id])
  	@price_query = @user.price_queries.new
  end

  def create
    @user = User.find_by_id(params[:user_id])
    query_params = params.require(:price_query).permit(:start_address, :nickname)
    puts params.inspect
    @price_query = @user.price_queries.create(query_params)
    puts params.inspect

    # redirect_to user_price_query_path(@user.id)
    redirect_to "/users/#{@user.id}/price_queries/#{@price_query.id}"
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @price_query = PriceQuery.find_by_id(params[:id])
    puts params.inspect
  end

  def edit
  end

  def delete
  end
end
