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

        day = price_result.day_of_week
        hour = price_result.hour_created

        day_all = query.price_results.where(day_of_week: day).all
        day_hour_all = day_all.where(hour_created: hour).all

        total_surge = 0

        day_hour_all.each do |entry|
          total_surge += entry.surge_multiplier
        end

        average_surge = total_surge / day_hour_all.length

        if query.averages.find_by_day_of_week(day) == nil
          avg_entry = query.averages.create({:day_of_week => day, :hour_created => hour})
        else
          day_entries = query.averages.where(day_of_week: day).all

          found_hour = false

          day_entries.each do |entry|
            if entry.hour_created == hour
              avg_entry = entry
              found_hour = true
            end
          end

          if found_hour == false
            avg_entry = query.averages.create({:day_of_week => day, :hour_created => hour})
          end

        end

        avg_entry.surge_multiplier = average_surge
        avg_entry.save

      end

      puts ' '
      puts '*' * 60
      puts ' '
      puts 'PRICE ESTIMATES'
      puts response_array
    end 
  end

end