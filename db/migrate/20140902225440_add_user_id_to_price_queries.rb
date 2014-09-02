class AddUserIdToPriceQueries < ActiveRecord::Migration
  def change
  	add_column :price_queries, :user_id, :integer
  end
end
