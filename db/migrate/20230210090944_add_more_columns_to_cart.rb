class AddMoreColumnsToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :purchased_price, :integer
    add_column :carts, :tax_per_item, :float
    add_column :carts, :item_tax, :float

  end
end
