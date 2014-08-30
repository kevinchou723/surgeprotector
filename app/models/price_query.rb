class PriceQuery < ActiveRecord::Base
	validates :start_latitude, :presence => true, :numericality => true, :length => {
		minimum: -90,
		maximum: 90
	}
	validates :start_longitude, :presence => true,:numericality => true, :length => {
		minimum: -180,
		maximum: 180
	}
	validates :end_latitude, :presence => true, :numericality => true, :length => {
		minimum: -90,
		maximum: 90
	}
	validates :end_longitude, :presence => true, :numericality => true, :length => {
		minimum: -180,
		maximum: 180
	}
	
	has_many :price_results
end
