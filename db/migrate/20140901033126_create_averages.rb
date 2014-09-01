class CreateAverages < ActiveRecord::Migration
  def change
    create_table :averages do |t|
      t.string :day_of_week
      t.integer :hour_created
      t.float :surge_multiplier
      t.references :price_query

      t.timestamps
    end
  end
end