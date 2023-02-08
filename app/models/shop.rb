class Shop < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :denominations, dependent: :destroy
end
