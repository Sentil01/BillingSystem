class Bill < ApplicationRecord

  belongs_to :shop
  has_many :carts,dependent: :destroy
  accepts_nested_attributes_for :carts,allow_destroy: true
  has_many :amounts,dependent: :destroy
  has_many :balance_denos,dependent: :destroy



  def amounts_attributes=(amounts_attributes)
    amounts_attributes.each do|i,amount_attribute|
      self.amounts.build(amount_attribute)
    end
  end

end
