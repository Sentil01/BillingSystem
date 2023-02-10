class AddMoreColumnsToBill < ActiveRecord::Migration[6.1]
  def change
    add_column :bills, :total_tax, :float
    add_column :bills, :total_amount, :float
    add_column :bills, :net_amount, :float
    add_column :bills, :balance, :integer

  end
end
