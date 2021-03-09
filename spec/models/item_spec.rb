require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品できるとき' do
      it 'imageが指定されている場合は出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空の場合は出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
       end
     it 'product_nameが空の場合は出品できない' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Product name can't be blank"
     end
     it 'descriptionが空の場合は出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
     end
     it 'category_idが1の場合は出品できない' do
      @item.category_id =  1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 1"
     end
     it 'status_idが1の場合は出品できない' do
      @item.status_id =  1
      @item.valid?
      expect(@item.errors.full_messages).to include "Status must be other than 1"
     end
     it 'burden_idが1の場合は出品できない' do
      @item.burden_id =  1
      @item.valid?
      expect(@item.errors.full_messages).to include "Burden must be other than 1"
     end
     it 'prefecture_idが1の場合は出品できない' do
      @item.prefecture_id =  1
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
     end
     it 'days_to_delivery_idが1の場合は出品できない' do
      @item.days_to_delivery_id =  1
      @item.valid?
      expect(@item.errors.full_messages).to include "Days to delivery must be other than 1"
     end
     it 'priceが空の場合は出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid"
     end
     it 'priceが300以下の場合は出品できない' do
      @item.price =  299
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid"
     end
     it 'priceが9,999,999以上の場合は出品できない' do
      @item.price =  10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid"
     end
     it '商品価格が半角英数字混合では出品できない' do
      @item.price = '500aaa111'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid"
     end
     it '商品価格が半角英字のみでは出品できない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid"
     end
     it '商品価格が全角文字では出品できない' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is invalid"
     end
    end
  end
end
