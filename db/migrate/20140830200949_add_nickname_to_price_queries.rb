class AddNicknameToPriceQueries < ActiveRecord::Migration
  def change
  	add_column :price_queries, :nickname, :string
  end
end
