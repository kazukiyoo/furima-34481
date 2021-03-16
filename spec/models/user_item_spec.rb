require 'rails_helper'

RSpec.describe UserItem, type: :model do
  before do
    @user_item = FactoryBot.build(:user_item)
  end
  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '郵便番号が入力されていれば登録できる' do
      end
    end
    context '商品購入できないとき' do
      it '郵便番号が数字で入力されていない場合登録できない' do
        @user_item.postal_code = 'aaa-aaa'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include "Postal code can't be blank"
      end
    end
  end
end
