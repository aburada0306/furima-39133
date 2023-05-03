require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全て入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it 'emailが@なしでは登録できない' do
        @user.email = 'abujun.email.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it '同じemailが登録済みである場合、登録できない' do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.email = @user.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include 'Eメールはすでに存在します'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end

      it 'passwordと確認用のpasswordが不一致だと登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '12345b'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end

      it 'passwordが6文字未満だと登録できない' do
        @user.password = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end

      it 'passwordが半角数字だけでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは半角英数を両方含む必要があります'
      end

      it 'passwordは全角文字では登録できない' do
        @user.password = '1234あa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数を両方含む必要があります')
      end

      it 'passwordは半角英語だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数を両方含む必要があります')
      end

      it 'Chinese_firstが空では登録できない' do
        @user.chinese_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前(姓)を入力してください"
      end
      it 'Chinese_firstが全角のひらがな/カナ/漢字以外では登録できない' do
        @user.chinese_first = 'abu'
        @user.valid?
        expect(@user.errors.full_messages).to include 'お名前(姓)は全角のひらがな/カナ/漢字で入力してください'
      end

      it 'chinese_lastが空では登録できない' do
        @user.chinese_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前(名)を入力してください"
      end
      it 'chinese_lastが全角のひらがな/カナ/漢字以外では登録できない' do
        @user.chinese_last = 'jun'
        @user.valid?
        expect(@user.errors.full_messages).to include 'お名前(名)は全角のひらがな/カナ/漢字で入力してください'
      end

      it 'Kana_firstが空では登録できない' do
        @user.kana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前全角カナ(姓)を入力してください"
      end
      it 'Kana_firstが全角のカナ以外では登録できない' do
        @user.kana_first = 'abu'
        @user.valid?
        expect(@user.errors.full_messages).to include 'お名前全角カナ(姓)は全角カタカナで入力してください'
      end

      it 'kana_lastが空では登録できない' do
        @user.kana_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前全角カナ(名)を入力してください"
      end
      it 'kana_lastが全角のカナ以外では登録できない' do
        @user.kana_last = 'jun'
        @user.valid?
        expect(@user.errors.full_messages).to include 'お名前全角カナ(名)は全角カタカナで入力してください'
      end

      it 'Birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "生年月日を入力してください"
      end
    end
  end
end
