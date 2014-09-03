class ApiCallsController < ApplicationController

  def index
    query
  end

  def query
    price_queries = PriceQuery.all
    price_queries.each do |query|

      # price estimates request from uber
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

      # for each response, create a new price result associated with the price query
      response_array.each do |response|
        price_result = query.price_results.create(response)

        # find the query's timezone
        timezone = Timezone::Zone.new :latlon => [query.start_latitude, query.start_longitude]
        price_result.local_time_created = timezone.time price_result.created_at

        # set the price result's day of week
        price_result.day_of_week = price_result.local_time_created.strftime("%A")

        # set the price result's hour created
        price_result.hour_created = price_result.local_time_created.hour

        # save the price result
        price_result.save

      end

      puts ' '
      puts '*' * 60
      puts ' '
      puts 'PRICE ESTIMATES'
      puts response_array
    end 
  end

end