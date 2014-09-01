class CreatePriceResults < ActiveRecord::Migration
  def change
    create_table :price_results do |t|
      t.string :localized_display_name
      t.string :low_estimate
      t.string :display_name
      t.string :product_id
      t.float :surge_multiplier
      t.string :estimate
      t.string :high_estimate
      t.references :price_query

      t.timestamps
    end
  end
end