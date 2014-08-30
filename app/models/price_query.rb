class PriceQuery < ActiveRecord::Base
	validates :start_latitude, :presence => true, :numericality => { :greater_than_or_equal_to => -90, :less_than_or_equal_to =>90}
	
	validates :start_longitude, :presence => true,:numericality => { :greater_than_or_equal_to => -180, :less_than_or_equal_to =>180}
	
	validates :end_latitude, :presence => true, :numericality => { :greater_than_or_equal_to => -90, :less_than_or_equal_to =>90}
	
	validates :end_longitude, :presence => true, :numericality => { :greater_than_or_equal_to => -180, :less_than_or_equal_to =>180}
	
	has_many :price_results
end
