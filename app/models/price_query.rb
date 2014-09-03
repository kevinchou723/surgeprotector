class PriceQuery < ActiveRecord::Base

  belongs_to :user
  has_many :price_results
  # has_many :averages

  # geocode address provided by user to get start lat and start lon
  geocoded_by :start_address, :latitude => :start_latitude, :longitude => :start_longitude
  before_validation :geocode

  # reverse geocode start lat and lon to get the name of the city the request is in
  reverse_geocoded_by :start_latitude, :start_longitude do |query, results|
    if geo = results.first
      query.city = geo.city
    end
  end
  before_validation :reverse_geocode

  # geocode just the city name to get lat and lon somewhere in the city as generic end point
  # done in controller

validates :start_latitude,
    :presence => true,
    :numericality => {
      :greater_than_or_equal_to => -90,
      :less_than_or_equal_to =>90
    }

validates :start_longitude,
    :presence => true,
    :numericality => {
      :greater_than_or_equal_to => -180,
      :less_than_or_equal_to =>180
    }

# validates :end_latitude,
#     :presence => true,
#     :numericality => {
#       :greater_than_or_equal_to => -90,
#       :less_than_or_equal_to =>90
#     }

# validates :end_longitude,
#     :presence => true,
#     :numericality => {
#       :greater_than_or_equal_to => -180,
#       :less_than_or_equal_to =>180
#     }

end