class AddMoreColoumnsToBill < ActiveRecord::Migration[6.1]
  def change
    add_column :bills, :five_hundred, :integer
    add_column :bills, :hundred, :integer
    add_column :bills, :fifty, :integer
    add_column :bills, :twenty, :integer
    add_column :bills, :ten, :integer
    add_column :bills, :five, :integer
    add_column :bills, :two, :integer
    add_column :bills, :one, :integer

  end
end
