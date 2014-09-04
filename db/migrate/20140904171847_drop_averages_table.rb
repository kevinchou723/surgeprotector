class DropAveragesTable < ActiveRecord::Migration

  def change
    drop_table :averages
  end

end