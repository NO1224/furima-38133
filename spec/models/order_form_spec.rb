require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入機能' do
    context '商品購入が可能' do
      it '全ての項目が条件を満たして存在している場合' do
        expect(@order_form).to be_valid
      end
      it '建物名が空の場合' do
        @order_form.building_name = nil
        expect(@order_form).to be_valid
      end
    end
    context '商品購入が失敗' do
      it 'ユーザーが存在しない場合' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it '商品が存在しない場合' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'カード情報(トークン)が空の場合' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空の場合' do
        @order_form.post_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号に(-)がついていない場合' do
        @order_form.post_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. It may not be include hyphen(-), incurrect format or not integer")
      end
      it '郵便番号で全角数値が使われている場合' do
        @order_form.post_code = "１２３-4567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. It may not be include hyphen(-), incurrect format or not integer")
      end
      it '都道府県における選択が空「---」の場合' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が空の場合' do
        @order_form.municipality = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空の場合' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空の場合' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に(-)が含まれている場合' do
        @order_form.phone_number = '000-0000-0000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. It may be include hyphen(-), not minimum-digits(10) or not integer")
      end
      it '電話番号が9桁以下の場合' do
        @order_form.phone_number = "123456789"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. It may be include hyphen(-), not minimum-digits(10) or not integer")
      end
      it '電話番号が12桁以上の場合' do
        @order_form.phone_number = "123456789123"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. It may be include hyphen(-), not minimum-digits(10) or not integer") 
      end
      it '電話番号で全角数値が使われている場合' do
        @order_form.phone_number = "１２３456789123"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. It may be include hyphen(-), not minimum-digits(10) or not integer")   
      end
    end
  end
end
