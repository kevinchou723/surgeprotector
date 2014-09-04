class PriceQueriesController < ApplicationController

  before_action :is_authenticated?
  
  def index
    if User.find(params[:user_id]) != @current_user
      redirect_to user_path(@current_user.id)
    else
      @user = @current_user
      redirect_to user_path(@user.id)
    end
  end

  def new
    if User.find(params[:user_id]) != @current_user
      redirect_to new_user_price_query_path(@current_user.id)
    else
      @user = @current_user
      @price_query = @user.price_queries.new
    end
  end

  def create
    if User.find(params[:user_id]) == @current_user
      @user = @current_user
      query_params = params.require(:price_query).permit(
        :start_address,
        :nickname
      )
      puts "Before created price query" + params.inspect
      @price_query = @user.price_queries.create(query_params)
      # adds geocoding for end point
      if @price_query.valid?
        geo_results = Geocoder.search(@price_query.city)
        puts "geo_results!!!!!!!!!!!" 
        @price_query.end_latitude = geo_results.first.latitude
        puts @price_query.end_latitude
        @price_query.end_longitude = geo_results.first.longitude
        @price_query.save
      end
      puts "After created price query" + params.inspect
      redirect_to user_price_query_path(@user.id, @price_query.id)
    else
      session[:user_id] = nil
      redirect_to login_path, :notice => 'Please re-login.'
    end
  end

  def show
    if User.find(params[:user_id]) != @current_user
      redirect_to user_path(@current_user.id)
    else
      @user = @current_user
      @price_query = PriceQuery.find_by_id(params[:id])
      @uber_types = []
      PriceResult.all.each do |result|
        if @uber_types.include? result.display_name
        else
          @uber_types.push(result.display_name)
        end
      end
    end
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
    if User.find(params[:user_id]) == @current_user
      @user = @current_user
      @price_query = PriceQuery.find_by_id(params[:id])
      @price_query.destroy
      redirect_to user_path(@user.id)
    else
      session[:user_id] = nil
      redirect_to login_path, :notice => 'Please re-login.'
    end
  end
end
