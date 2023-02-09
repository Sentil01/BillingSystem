class Bill < ApplicationRecord
  belongs_to :shop
  has_many :carts,dependent: :destroy
  accepts_nested_attributes_for :carts,allow_destroy: true
end
