class CreatePriceQueries < ActiveRecord::Migration
  def change
    create_table :price_queries do |t|
      t.float :start_latitude
      t.float :start_longitude
      t.float :end_latitude
      t.float :end_longitude
      t.string :city

      t.timestamps
    end
  end
end
