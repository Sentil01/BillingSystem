class RemoveTwentyFromDenomination < ActiveRecord::Migration[6.1]
  def change
    remove_column :denominations, :twenty, :integer
  end
end
