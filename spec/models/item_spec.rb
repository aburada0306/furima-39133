require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテムの保存' do
    context '新規投稿できるとき' do
      it '全て入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規投稿できないとき' do
      it 'userが紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "ユーザーを入力してください"
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "商品画像を入力してください"
      end
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "タイトルを入力してください"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の金額を入力してください"
      end
      it 'priceが300円以上でないと登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の金額が無効です'
      end
      it 'priceが9,999,999円以下でないと登録できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の金額が無効です'
      end
      it 'priceは半角数値以外では保存できない' do
        @item.price = '３００あa'
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の金額が無効です'
      end
      it 'contentが空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'postage_idが初期値では登録できない' do
        @item.postage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担が無効です"
      end
      it 'category_idが初期値では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーが無効です"
      end
      it 'status_idが初期値では登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態が無効です"
      end
      it 'prefecture_idが初期値では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域が無効です"
      end
      it 'delivery_idが初期値では登録できない' do
        @item.delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数が無効です"
      end
    end
  end
end
