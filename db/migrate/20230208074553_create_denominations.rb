class CreateDenominations < ActiveRecord::Migration[6.1]
  def change
    create_table :denominations do |t|
      t.integer :five_hundred
      t.integer :hundred
      t.integer :fifty
      t.integer :twenty
      t.integer :ten
      t.integer :five
      t.integer :two
      t.integer :one
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
