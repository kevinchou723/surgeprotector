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

    puts 'UBER TYPES!!!!'
    puts @uber_types

  end

  def search
    @city_queries = PriceQuery.where(city: params[:city]).all

    @filtered_results = []

    @city_queries.each do |query|
      result_matches = query.price_results
      .where(day_of_week: params[:day]).all
      .where(display_name: params[:uber_type]).all

      result_matches.each do |match|
        @filtered_results.push(match)
      end
    end

    puts @filtered_results
  end

  def about
  end

end