class PriceQuery < ActiveRecord::Base
<<<<<<< HEAD
	validates :start_latitude, :presence => true, :numericality => { :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90}
	validates :start_longitude, :presence => true,:numericality => { :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180}
	validates :end_latitude, :presence => true, :numericality => { :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90}
	validates :end_longitude, :presence => true, :numericality => { :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180}
	
	has_many :price_results
end
=======

  has_many :price_results
  has_many :averages

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
	
	validates :end_latitude,
    :presence => true,
    :numericality => {
      :greater_than_or_equal_to => -90,
      :less_than_or_equal_to =>90
    }
	
	validates :end_longitude,
    :presence => true,
    :numericality => {
      :greater_than_or_equal_to => -180,
      :less_than_or_equal_to =>180
    }

end
>>>>>>> c55e04610d70615bb223da223f2593e0b18c35fc
