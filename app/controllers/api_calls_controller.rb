class ApiCallsController < ApplicationController

  def index

    sf = PriceQuery.find_by_city("San Francisco")

    # price estimates request
    request = Typhoeus.get(
      'https://api.uber.com/v1/estimates/price',
      :params => {
        :server_token => ENV['UBER_SERVER_TOKEN'],
        :start_latitude => sf.start_latitude,
        :start_longitude => sf.start_longitude,
        :end_latitude => sf.end_latitude,
        :end_longitude => sf.end_longitude
      }
    )

    response = JSON.parse(request.body)
    response_array = response['prices']

    response_array.each do |response|
      sf.price_results.create(response)
    end

    puts ' '
    puts '*' * 60
    puts ' '
    puts 'PRICE ESTIMATES'
    puts response_array

  end

end