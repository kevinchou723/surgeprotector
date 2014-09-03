class PriceQuery < ActiveRecord::Base

  belongs_to :user
  has_many :price_results
  # has_many :averages

  geocoded_by :start_address, :latitude => :start_latitude, :longitude => :start_longitude
  before_validation :geocode

  # reverse_geocoded_by :start_latitude, :start_longitude
  # before_validation :reverse_geocode

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