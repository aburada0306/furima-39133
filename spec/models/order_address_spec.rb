require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end
  describe '住所情報の保存' do
  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end

    it '建物名は空でも保存できること' do
      @order_address.building = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空だと保存できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
    it '郵便番号が空だと保存できないこと' do
      @order_address.post_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
    end
    it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.post_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('郵便番号は(-)を含む入力にしてください')
    end
    it '都道府県を選択していないと保存できないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
    end
    it '市区町村を選択していないと保存できないこと' do
      @order_address.city = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
    end
    it '番地を選択していないと保存できないこと' do
      @order_address.street = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("番地を入力してください")
    end
    it '電話番号が空だと保存できないこと' do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
    end
    it '電話番号が半角数値以外だと保存できないこと' do
      @order_address.phone_number = '123456あa１２'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('電話番号は無効です')
    end
    it '電話番号は、10桁以上11桁以内のみ保存可能なこと' do
      @order_address.phone_number = '123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('電話番号は無効です')
    end
    it '電話番号は、12桁以上は保存できないこと' do
      @order_address.phone_number = '123456789123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('電話番号は無効です')
    end
    it 'itemが紐付いていないと保存できないこと' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("商品を入力してください")
    end
    it 'userが紐付いていないと保存できないこと' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("ユーザーを入力してください")
    end
  end
end
end
