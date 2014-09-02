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
        price_result.save

        # save the price result's day of week the db
        price_result.day_of_week = price_result.local_time_created.strftime("%A")
        price_result.save

        # save the price result's hour created to the db
        price_result.hour_created = price_result.local_time_created.hour
        price_result.save

        # AVERAGES LOGIC -- NOT IN USE

        # # find the day and hour for the price result
        # day = price_result.day_of_week
        # hour = price_result.hour_created

        # # find all day/hour price result matches associated with the query
        # day_all = query.price_results.where(day_of_week: day).all
        # day_hour_all = day_all.where(hour_created: hour).all

        # total_surge = 0

        # # add up surge multipliers for the day/hour price result matches
        # day_hour_all.each do |entry|
        #   total_surge += entry.surge_multiplier
        # end

        # # calculate average surge for a given day/hour
        # average_surge = total_surge / day_hour_all.length

        # # find the day/hour match for the query in the averages table
        # if query.averages.find_by_day_of_week(day) == nil
        #   avg_entry = query.averages.create({:day_of_week => day, :hour_created => hour})
        # else
        #   day_entries = query.averages.where(day_of_week: day).all

        #   found_hour = false

        #   day_entries.each do |entry|
        #     if entry.hour_created == hour
        #       avg_entry = entry
        #       found_hour = true
        #     end
        #   end

        #   # if not found, created new entry for that day/hour
        #   if found_hour == false
        #     avg_entry = query.averages.create({:day_of_week => day, :hour_created => hour})
        #   end

        # end

        # # update the entry in the averages table with the average surge
        # avg_entry.surge_multiplier = average_surge
        # avg_entry.save

      end

      puts ' '
      puts '*' * 60
      puts ' '
      puts 'PRICE ESTIMATES'
      puts response_array
    end 
  end

end