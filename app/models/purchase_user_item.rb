class PurchaseUserItem
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :municipality
  validates :address
  validates :user_id
  validates :item_id
  validates :token
  end

  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は半角数字とハイフンを入れて入力してください' }
  validates :phone_number,presence: true, format: { with: /\A\d{11}\z/, message: 'は11桁で入力してください' }

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Purchase.create(user_item_id: user_item.id, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end
end