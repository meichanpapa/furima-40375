require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入情報の保存' do
    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_shipping_address.building_name = ''
        expect(@order_shipping_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'tokenが空では購入できないこと' do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では保存できないこと' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが初期値(1)では保存できない' do
        @order_shipping_address.prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できないこと' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では保存できないこと' do
        @order_shipping_address.house_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @order_shipping_address.postal_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'phone_numberが全角数字では保存できないこと' do
        @order_shipping_address.phone_number = '０９０１２３４５６７８'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number is invalid. Please include 10 to 11 digits without hyphens')
      end
      it 'phone_numberが9桁以下では保存できないこと' do
        @order_shipping_address.phone_number = '090123456'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number is invalid. Please include 10 to 11 digits without hyphens')
      end
      it 'phone_numberが12桁以上では保存できないこと' do
        @order_shipping_address.phone_number = '090123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number is invalid. Please include 10 to 11 digits without hyphens')
      end
      it 'phone_numberは半角のハイフンを含めると保存できないこと' do
        @order_shipping_address.phone_number = '03-123-5678'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number is invalid. Please include 10 to 11 digits without hyphens')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
