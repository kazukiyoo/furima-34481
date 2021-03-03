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

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6,}/.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :surname
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角文字を使用してください' } do
    validates :surname_kana
    validates :first_name_kana
  end
end
