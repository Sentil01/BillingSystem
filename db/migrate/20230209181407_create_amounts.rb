class CreateAmounts < ActiveRecord::Migration[6.1]
  def change
    create_table :amounts do |t|
      t.integer :five_hundred, :default => 0
      t.integer :hundred, :default => 0
      t.integer :fifty, :default => 0
      t.integer :ten, :default => 0
      t.integer :five, :default => 0
      t.integer :two, :default => 0
      t.integer :one, :default => 0
      t.references :bill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
