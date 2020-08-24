require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー作成' do
    context 'すべての情報が揃っていれば、登録できる。' do
      it '全て正常' do
        expect(@user.valid?).to eq true
      end
    end
    context '内容に問題がある場合' do
      it 'nicknameがなければ登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'passwordがなければ登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以上でなければ登録できない' do
        @user.password = 'aA1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordはアルファベットだけでは登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordは数値だけでは登録できない' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordは全角では登録できない' do
        @user.password = 'ＡＡＡＡＡ１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'emailがなければ登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは一意性を持つ' do
        first_user = FactoryBot.create(:user, email: 'test@test.co.jp')
        second_user = FactoryBot.build(:user, email: 'test@test.co.jp')
        second_user.valid?
        expect(second_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailは@を含まなければならない' do
        @user.email = 'test.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'birth_dateがなければ登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it 'first_nameがなければ登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it 'last_nameがなければ登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できな' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      it 'first_name_kanaがなければ登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaはひらがなでは登録できない' do
        @user.first_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it 'first_name_kanaはアルファベットでは登録できない' do
        @user.first_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it 'last_name_kanaがなければ登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaはひらがなでは登録できない' do
        @user.last_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end
      it 'last_name_kanaはアルファベットでは登録できない' do
        @user.last_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end
    end
  end
end
