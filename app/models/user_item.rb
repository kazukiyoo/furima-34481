class UserItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :purchase
  
  #validates :user, presence: true
  #validates :item, presence: true
end
