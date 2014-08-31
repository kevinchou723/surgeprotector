class PriceResultsController < ApplicationController

  def index
    @price_queries = PriceQuery.all
  end

end