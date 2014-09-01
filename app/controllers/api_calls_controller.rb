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
        price_result = query.price_results.create(response)

        if price_result.created_at.monday? == true
          price_result.day_of_week = "Monday"
          price_result.save
        elsif price_result.created_at.tuesday? == true
          price_result.day_of_week = "Tuesday"
          price_result.save
        elsif price_result.created_at.wednesday? == true
          price_result.day_of_week = "Wednesday"
          price_result.save
        elsif price_result.created_at.thursday? == true
          price_result.day_of_week = "Thursday"
          price_result.save
        elsif price_result.created_at.friday? == true
          price_result.day_of_week = "Friday"
          price_result.save
        elsif price_result.created_at.saturday? == true
          price_result.day_of_week = "Saturday"
          price_result.save
        elsif price_result.created_at.sunday? == true
          price_result.day_of_week = "Sunday"
          price_result.save
        end

        price_result.hour_created = price_result.created_at.hour
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