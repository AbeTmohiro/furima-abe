require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
    @item.image = fixture_file_upload('/sample.png', 'image/png')
  end
  describe 'create' do
    context '内容に問題ない場合' do
      it 'すべて正常に入力されていれば、保存できる。' do
        expect(@item.valid?).to eq true
      end
    end
    context '内容に問題がある場合' do
      it 'imageが必須である' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが必須である' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが必須である' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'priceが必須である' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは300円以上である。' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceは9,999,999円以下である' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'category_idが0では受け付けない。' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select please.")
      end
      it 'condition_idが0では受け付けない。' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select please.")
      end
      it 'shipping_fee_idが0では受け付けない。' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee Select please.")
      end
      it 'prefecture_idが0では受け付けない。' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select please.")
      end
      it 'delivery_day_idが0では受け付けない。' do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day Select please.")
      end
    end
  end
end
