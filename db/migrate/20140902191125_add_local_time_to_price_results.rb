class AddLocalTimeToPriceResults < ActiveRecord::Migration

  def change
    add_column :price_results, :local_time_created, :datetime
  end

end