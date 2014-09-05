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

      # test geocode from start_address to start_lat/start_lon
      initial_results = Geocoder.search(query_params["start_address"])
      if initial_results.length > 1
        redirect_to new_user_price_query_path(@user.id), :alert => 'Too many results for that address. Please be more specific.'
        return false
      elsif initial_results.length < 1
         redirect_to new_user_price_query_path(@user.id), :alert => 'Could not find that address. Please be more specific.'
         return false
      elsif initial_results.length == 1
        # creates price query if one valid address match was found
        @price_query = @user.price_queries.create(query_params)
      end

      # adds geocoding for end point, using generic lat/long for name of city
      if @price_query.valid?
        geo_results = Geocoder.search(@price_query.city)
        @price_query.end_latitude = geo_results.first.latitude
        puts @price_query.end_latitude
        @price_query.end_longitude = geo_results.first.longitude
        @price_query.save
        redirect_to place_path(@user.id, @price_query.id), :notice => 'New place created successfully. You\'ll start getting surge data after a few hours.'
      else
        redirect_to new_user_price_query_path(@user.id), :alert => 'Please try again.'
      end
    # if the user is not the correct user of this page
    else
      session[:user_id] = nil
      redirect_to login_path, :notice => 'Please log in again.'
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
      redirect_to login_path, :notice => 'Please log in again.'
    end
  end
end