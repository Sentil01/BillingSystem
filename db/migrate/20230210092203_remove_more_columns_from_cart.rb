class RemoveMoreColumnsFromCart < ActiveRecord::Migration[6.1]
  def change
    remove_column :bills, :five_hundred, :integer
    remove_column :bills, :hundred, :integer
    remove_column :bills, :fifty, :integer
    remove_column :bills, :twenty, :integer
    remove_column :bills, :ten, :integer
    remove_column :bills, :five, :integer
    remove_column :bills, :two, :integer
    remove_column :bills, :one, :integer
  end
end
