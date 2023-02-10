class CreateBalanceDenos < ActiveRecord::Migration[6.1]
  def change
    create_table :balance_denos do |t|
      t.integer :c500
      t.integer :c100
      t.integer :c50
      t.integer :c10
      t.integer :c5
      t.integer :c2
      t.integer :c1
      t.references :bill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
