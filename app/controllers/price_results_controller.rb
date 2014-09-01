class PriceResultsController < ApplicationController

  def index
    @price_queries = PriceQuery.all
  end

  def show
    @price_query = PriceQuery.find_by_id(params[:id])
    @days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  end

end