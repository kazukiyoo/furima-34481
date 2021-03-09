class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :days_to_delivery
  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image

  validates :product_name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  validates :status_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :days_to_delivery_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 } 
 
end
