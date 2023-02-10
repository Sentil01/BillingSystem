class DropBalances < ActiveRecord::Migration[6.1]
  def change
    drop_table :balances do |t|


      t.integer "c500"
      t.integer "c100"
      t.integer "c50"
      t.integer "c10"
      t.integer "c5"
      t.integer "c2"
      t.integer "c1"
      t.integer "bill_id"
      t.timestamps

    end
  end
end
