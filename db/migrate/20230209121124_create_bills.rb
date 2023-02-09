class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.string :email_id
      t.string :name
      t.integer :amount_paid
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
