require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end

  describe '商品出品機能(新規出品)' do
    context '商品出品が可能' do
      it '全ての項目が条件を満たして存在している場合' do
        expect(@item).to be_valid
      end
    end
    context '商品出品が失敗' do
      it 'ユーザーが存在しない場合' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it '画像ファイルが空の場合' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空の場合' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品名が40文字超過の場合' do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it '商品の説明が空の場合' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it '商品の説明が1000文字超過の場合' do
        @item.explanation = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation is too long (maximum is 1000 characters)")
      end
      it 'カテゴリーにおける選択が空「---」の場合' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態における選択が空「---」の場合' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it '配送料の負担における選択が空「---」の場合' do
        @item.delivery_pay_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery pay must be other than 1")
      end
      it '発送元の地域における選択が空「---」の場合' do
        @item.delivery_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source must be other than 1")
      end
      it '発送までの日数における選択が空「---」の場合' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
      end
      it '販売価格が空の場合' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が英字で入力されている場合' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が半角文字で入力されている場合' do
        @item.price = 'ａあア阿'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が¥300未満の場合' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it '販売価格が¥9,999,999超過の場合' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
    end
  end
end
