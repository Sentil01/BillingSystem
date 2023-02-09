class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.integer :quantity
      t.references :bill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
