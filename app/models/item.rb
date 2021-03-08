class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :days_to_delivery
  belongs_to :prefecture
  belongs_to :user

  validates :product_name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :status_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :days_to_delivery_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 } 

end
