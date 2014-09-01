class AddDayOfWeekToPriceResults < ActiveRecord::Migration

  def change
    add_column :price_results, :day_of_week, :string
  end

end