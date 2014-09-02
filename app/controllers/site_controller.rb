class SiteController < ApplicationController

  def index
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