class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :surname, presence: true
  validates :first_name, presence: true
  validates :surname_kana, presence: true
  validates :first_name_kana, presence: true
  validates :nickname, presence: true
  # validates :email, presence: true, unique: true
  # validates :encrypted_password, presence: true
  validates :birthday, presence: true

end
