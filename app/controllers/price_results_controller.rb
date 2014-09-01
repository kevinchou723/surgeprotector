class PriceResultsController < ApplicationController

  def index
    @price_queries = PriceQuery.all
  end

  def show
    @price_query = PriceQuery.find_by_id(params[:id])
  end

end