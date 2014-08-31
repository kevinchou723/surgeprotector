class ApiCallsController < ApplicationController

  def index
    query
  end

  def query
    price_queries = PriceQuery.all
    price_queries.each do |query|

      # price estimates request
      request = Typhoeus.get(
        'https://api.uber.com/v1/estimates/price',
        :params => {
          :server_token => ENV['UBER_SERVER_TOKEN'],
          :start_latitude => query.start_latitude,
          :start_longitude => query.start_longitude,
          :end_latitude => query.end_latitude,
          :end_longitude => query.end_longitude
        }
      )

      response = JSON.parse(request.body)
      response_array = response['prices']

      response_array.each do |response|
        query.price_results.create(response)
      end

      puts ' '
      puts '*' * 60
      puts ' '
      puts 'PRICE ESTIMATES'
      puts response_array
    end 
  end

end