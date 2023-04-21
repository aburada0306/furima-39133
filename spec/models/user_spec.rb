require 'rails_helper'
RSpec.describe User, type: :model do
before do
  @user = FactoryBot.build(:user)
end


  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'passwordと確認用のpasswordが一致していると登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上だと登録できる' do
        @user.password = '12345a6'
        @user.password_confirmation = '12345a6'
        expect(@user).to be_valid
      end

     end
  context '新規登録できないとき' do
    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailが@なしでは登録できない' do
      @user.email = 'abujun.email.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it '同じemailが登録済みである場合、登録できない' do
      @user.save
      @user2 = FactoryBot.build(:user)
      @user2.email = @user.email 
      @user2.valid?
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが半角数字だけでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
    end

    it "passwordは全角文字では登録できない" do
      @user.password = "1234あa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it "passwordは半角英語だけでは登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it 'Chinese_firstが空では登録できない' do
      @user.chinese_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Chinese first can't be blank"
    end
    it 'Chinese_firstが全角のひらがな/カナ/漢字以外では登録できない' do
      @user.chinese_first = 'abu'
      @user.valid?
      expect(@user.errors.full_messages).to include "Chinese first Input full-width characters"
    end

    it 'chinese_lastが空では登録できない' do
      @user.chinese_last = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Chinese last can't be blank"
    end
    it 'chinese_lastが全角のひらがな/カナ/漢字以外では登録できない' do
      @user.chinese_last = 'jun'
      @user.valid?
      expect(@user.errors.full_messages).to include "Chinese last Input full-width characters"
    end

    it 'Kana_firstが空では登録できない' do
      @user.kana_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana first can't be blank"
    end
    it 'Kana_firstが全角のカナ以外では登録できない' do
      @user.kana_first = 'abu'
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana first Input full-width katakana characters"
    end

    it 'kana_lastが空では登録できない' do
      @user.kana_last = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana last can't be blank"
    end
    it 'kana_lastが全角のカナ以外では登録できない' do
      @user.kana_last = 'jun'
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana last Input full-width katakana characters"
    end

    it 'Birthが空では登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth can't be blank"
    end
  end
 end
end
