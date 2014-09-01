class AddHourCreatedToPriceResults < ActiveRecord::Migration

  def change
    add_column :price_results, :hour_created, :integer
  end

end