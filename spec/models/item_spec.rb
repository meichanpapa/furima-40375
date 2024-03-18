require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品できるとき' do
      it 'image、item_name、item_info、category_id、condition_id、shipping_fee_responsibility_id、prefecture_id、days_until_shipping_id、sell_priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoが空では出品できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'category_idが初期値(1)では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが初期値(1)では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_fee_responsibility_idが初期値(1)では出品できない' do
        @item.shipping_fee_responsibility_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee responsibility can't be blank")
      end
      it 'prefecture_idが初期値(1)では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'days_until_shipping_idが初期値(1)では出品できない' do
        @item.days_until_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days until shipping can't be blank")
      end
      it 'sell_priceが空では出品できない' do
        @item.sell_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sell price can't be blank")
      end
      it 'sell_priceが￥299以下では出品できない' do
        @item.sell_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Sell price must be greater than or equal to 300')
      end
      it 'sell_priceが￥10000000以上では出品できない' do
        @item.sell_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Sell price must be less than or equal to 9999999')
      end
      it 'sell_priceが全角数字では出品できない' do
        @item.sell_price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Sell price is not a number')
      end
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
