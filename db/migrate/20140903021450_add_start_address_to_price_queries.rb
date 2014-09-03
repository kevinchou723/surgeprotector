class AddStartAddressToPriceQueries < ActiveRecord::Migration
  def change
  	add_column :price_queries, :start_address, :string
  end
end
