class Shop < ApplicationRecord
  validates :name, presence: true
  validates :subdomain, presence: true, uniqueness: true

  has_many :products, class_name: 'Spree::Product', foreign_key: :shop_id, inverse_of: :shop
end
