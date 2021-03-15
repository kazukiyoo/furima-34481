class PurchaseUserItem
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
  validates :postal_code
  validates :prefecture_id
  validates :municipality
  validates :address
  validates :phone_number

  validates :user_id
  validates :item_id
  end

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Purchase.create(user_item_id: user_item.id, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end
end