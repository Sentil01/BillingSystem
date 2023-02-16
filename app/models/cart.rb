class Cart < ApplicationRecord
  belongs_to :bill
  validates :quantity,:product_id,presence: true
end
