class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :product_name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :prefecture_id, presence: true
  validates :burden_id, presence: true
  validates :days_to_delivery_id, presence: true

end
