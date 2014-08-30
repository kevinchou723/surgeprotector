class ApiCallsController < ApplicationController

  def index

    # price estimates request
    request = Typhoeus.get(
      'https://api.uber.com/v1/estimates/price',
      :params => {
        :server_token => ENV['UBER_SERVER_TOKEN'],
        :start_latitude => 37.786958,
        :start_longitude => -122.394462,
        :end_latitude => 37.777034,
        :end_longitude => -122.4152628
      }
    )

    price_results = JSON.parse(request.body)

    puts ' '
    puts '*' * 60
    puts ' '
    puts 'PRICE ESTIMATES'
    puts price_results

  end

end