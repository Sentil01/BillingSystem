class Bill < ApplicationRecord
  belongs_to :shop
  has_many :carts,dependent: :destroy
  accepts_nested_attributes_for :carts,allow_destroy: true
  has_one :amount
  def amount_attributes=(a_attributes)

      self.amount.build(a_attribute)

  end
end
