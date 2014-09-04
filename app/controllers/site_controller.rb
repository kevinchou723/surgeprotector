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
    @uber_types.push("view all Uber Types")

    PriceResult.all.each do |result|
      if @uber_types.include? result.display_name
      else
        @uber_types.push(result.display_name)
      end
    end

    puts 'UBER TYPES!!!!'
    puts @uber_types

  end

  def search

    @city = params[:search][:city]
    @day = params[:search][:day]
    @uber = params[:search][:uber_type]

    @city_queries = PriceQuery.where(city: @city).all

    @filtered_results = []

    # all uber types not yet working but not really breaking
    if :uber_type == "view all Uber Types"
      @city_queries.each do |query|
        @result_matches = query.price_results
          .where(day_of_week: @day).all

        @result_matches.each do |match|
          @filtered_results.push(match)
        end
      end
    else
      @city_queries.each do |query|
        @result_matches = query.price_results
          .where(day_of_week: @day, display_name: @uber).all

        @result_matches.each do |match|
          @filtered_results.push(match)
        end
      end
    end # end of if else for all uber types

    respond_to do |f|
      f.json {render :json => @filtered_results}
    end

  end

  def about
  end

end