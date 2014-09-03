class PriceQueriesController < ApplicationController

  before_action :is_authenticated?
  
  def index
    @user = User.find_by_id(params[:user_id])
    redirect_to "/users/#{@user.id}/"
  end

  def new
  	@user = User.find_by_id(params[:user_id])
  	@price_query = @user.price_queries.new
  end

  def create
    @user = User.find_by_id(params[:user_id])
    query_params = params.require(:price_query).permit(:start_address, :nickname)
    puts "Before created price query" + params.inspect
    @price_query = @user.price_queries.create(query_params)

    # adds geocoding for end point
    if @price_query.valid?
      geo_results = Geocoder.search(@price_query.city)
      puts "geo_results!!!!!!!!!!!" 
      @price_query.end_latitude = geo_results.first.latitude.to_f
      @price_query.end_longitude = geo_results.first.longitude.to_f
    end
    puts "After created price query" + params.inspect

    # redirect_to user_price_query_path(@user.id)
    redirect_to "/users/#{@user.id}/price_queries/#{@price_query.id}"
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @price_query = PriceQuery.find_by_id(params[:id])
    puts params.inspect
  end

  ## decided to simplify and not include these actions
  # def edit
  #     @user = User.find_by_id(params[:user_id])
  #     @price_query = PriceQuery.find_by_id(params[:id])
  # end

  # def update
  #     @user = User.find_by_id(params[:user_id])
  #     @price_query = PriceQuery.find_by_id(params[:id])

  #     redirect_to user_path(@user.id)
  # end

  def destroy
      @user = User.find_by_id(params[:user_id])
      @price_query = PriceQuery.find_by_id(params[:id])

      @price_query.destroy

      redirect_to user_path(@user.id)
  end
end
