require 'rails_helper'

RSpec.describe PurchaseUserItem, type: :model do
  before do
    @purchase_user_item = FactoryBot.build(:purchase_user_item)
  end
  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '建物名が空でも登録できる' do
        @purchase_user_item.building_name = ''
        expect(@purchase_user_item).to be_valid
      end
      it 'tokenがあれば保存できること' do
        expect(@purchase_user_item).to be_valid
      end
    end
    context '商品購入できないとき' do
      it '郵便番号が数字で入力されていない場合登録できない' do
        @purchase_user_item.postal_code = 'aaa-aaa'
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Postal code は半角数字とハイフンを入れて入力してください"
      end
      it '郵便番号にハイフンが含まれていない場合登録できない' do
        @purchase_user_item.postal_code = '123456'
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Postal code は半角数字とハイフンを入れて入力してください"
      end
      it '郵便番号が全角数字で入力されている場合登録できない' do
        @purchase_user_item.postal_code = '１２３-４５６'
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Postal code は半角数字とハイフンを入れて入力してください"
      end
      it '郵便番号が空の場合登録できない' do
        @purchase_user_item.postal_code = ''
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Postal code は半角数字とハイフンを入れて入力してください"
      end
      it '都道府県が選択されていない場合登録できない' do
        @purchase_user_item.municipality = ''
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Municipality can't be blank"
      end
      it '市区町村が空の場合登録できない' do
        @purchase_user_item.address = ''
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が空の場合登録できない' do
        @purchase_user_item.phone_number = ''
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Phone number は11桁で入力してください"
      end
      it '電話番号が11桁以下の場合登録できない' do
        @purchase_user_item.phone_number = '1234567890'
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Phone number は11桁で入力してください"
      end
      it 'tokenが空では登録できない' do
        @purchase_user_item.token = ''
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end