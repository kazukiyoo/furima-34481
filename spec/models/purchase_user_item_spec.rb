require 'rails_helper'

RSpec.describe PurchaseUserItem, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_user_item = FactoryBot.build(:purchase_user_item, user_id: @user.id , item_id: @item.id)
    sleep 0.1
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
      it '都道府県が1で選択されている場合登録できない' do
        @purchase_user_item.prefecture_id = 1
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it '市区町村が空の場合登録できない' do
        @purchase_user_item.address = ''
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が空の場合登録できない' do
        @purchase_user_item.phone_number = ''
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Phone number can't be blank", "Phone number は10桁もしくは11桁で入力してください"
      end
      it '電話番号に英数字が入力されていた場合登録できない' do
        @purchase_user_item.phone_number = '090aaaaaaaa'
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Phone number は10桁もしくは11桁で入力してください"
      end
      it '電話番号が11桁以下の場合登録できない' do
        @purchase_user_item.phone_number = '123456789'
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Phone number は10桁もしくは11桁で入力してください"
      end
      it 'tokenが空では登録できない' do
        @purchase_user_item.token = ''
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Token can't be blank"
      end
      it 'user_idが空の場合購入できない' do
        @purchase_user_item.user_id = ''
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空の場合購入できない' do
        @purchase_user_item.item_id = ''
        @purchase_user_item.valid?
        expect(@purchase_user_item.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end