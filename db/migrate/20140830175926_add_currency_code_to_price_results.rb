class AddCurrencyCodeToPriceResults < ActiveRecord::Migration

  def change
  	add_column :price_results, :currency_code, :string
  end

end