class Purchase < ApplicationRecord
  belongs_to :user_item

  #validates :user_item, presence: true
  #validates :postal_code, presence: true
  #validates :prefecture_id, presence: true
  #validates :municipality, presence: true
  #validates :address, presence: true
  #validates :building_name, presence: true
  #validates :phone_number, presence: true
end
