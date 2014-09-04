class SiteController < ApplicationController

  def index
    @cities = []

    PriceQuery.all.each do |query|
      if @cities.include? query.city
      else
        @cities.push(query.city)
      end
    end

    @uber_types = []

    PriceResult.all.each do |result|
      if @uber_types.include? result.display_name
      else
        @uber_types.push(result.display_name)
      end
    end

  end

  def search

    @city = params[:search][:city]
    @day = params[:search][:day]
    @uber = params[:search][:uber_type]
    @query_id = params[:search][:price_query_id]

    # SEARCH ON SPECIFIC PRICE_QUERY PAGE
    if @city == nil
      @city_query = PriceQuery.find(@query_id)

      # if user selects 'All Uber Types'
      if @uber == "All Uber Types"
        @filtered_results = @city_query.price_results
          .where(day_of_week: @day)
      # if user selects specific uber type
      else
        @filtered_results = @city_query.price_results
          .where(day_of_week: @day, display_name: @uber)
      end

    # GENERAL SEARCH ON HOMEPAGE
    else
      @city_queries = PriceQuery.where(city: @city)
      @filtered_results = []
      # if user selects 'All Uber Types'
      if @uber == "All Uber Types"
        @city_queries.each do |query|
          @result_matches = query.price_results
            .where(day_of_week: @day)
          @result_matches.each do |match|
            @filtered_results.push(match)
          end
        end
      # if user selects specific uber type
      else
        @city_queries.each do |query|
          @result_matches = query.price_results
            .where(day_of_week: @day, display_name: @uber)

          @result_matches.each do |match|
            @filtered_results.push(match)
          end
        end
      end
    end
    respond_to do |f|
      f.json {render :json => @filtered_results}
    end
  end

  def about
  end

end