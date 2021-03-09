class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :days_to_delivery
  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :product_name
  validates :description
  validates :image
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  end

  with_options numericality: { other_than: 1 } do
  validates :status_id
  validates :prefecture_id
  validates :burden_id
  validates :days_to_delivery_id
  validates :category_id
  end
end
