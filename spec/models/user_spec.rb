require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー管理機能(新規登録)' do
    context '新規登録が可能' do
      it '全ての項目が条件を満たして存在している場合' do
        expect(@user).to be_valid
      end
    end
    context '新規登録が失敗' do
      it 'ニックネームが空の場合' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空の場合' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが既に重複している値の場合' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスに「@」が含まれていない場合' do
        @user.email = 'testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが空の場合' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが5文字以下の場合' do
        @user.password = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードが英字のみの場合' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password include both letters and numbers")
      end
      it 'パスワードが数字のみの場合' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password include both letters and numbers")
      end
      it 'パスワードに全角文字が含まれている場合' do
        @user.password = 'ａａａaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password include both letters and numbers")
      end
      it 'パスワードとパスワード(確認)が不一致の場合' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(苗字)が空の場合' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(苗字)にアルファベットが含まれている場合' do
        @user.last_name = 'a阿あア'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name full-width kanji, hiragana and katakana characters")
      end
      it 'お名前(名前)が空の場合' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(名前)にアルファベットが含まれている場合' do
        @user.first_name = 'a阿あア'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name full-width kanji, hiragana and katakana characters")
      end
      it 'お名前カナ(苗字)が空の場合' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前カナ(苗字)に全角（カタカナ）以外が含まれている場合' do
        @user.first_name_kana = 'a阿あア'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana full-width katakana characters")
      end
      it 'お名前カナ(名前)が空の場合' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ(名前)に全角（カタカナ）以外が含まれている場合' do
        @user.last_name_kana = 'a阿あア'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana full-width katakana characters")
      end
      it '生年月日が空の場合' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
