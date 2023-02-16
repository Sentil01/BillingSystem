class Shop < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :denominations, dependent: :destroy
  has_many :bills, dependent: :destroy

end
