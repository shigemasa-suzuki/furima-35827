require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

  describe 'itemの保存' do
    context 'itemが投稿できる場合' do
    it '必要項目がが存在していれば保存できること' do
      expect(@item).to be_valid
    end
  end
  context 'itemが投稿できない場合' do
    it 'nameが空では保存できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'infoが空では保存できないこと' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it 'category_idが空では保存できないこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'category_idが1では保存できないこと' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'status_idが空では保存できないこと' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'status_idが1では保存できないこと' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it 'shipping_fee_idが空では保存できないこと' do
      @item.shipping_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end

    it 'shipping_fee_idが1では保存できないこと' do
      @item.shipping_fee_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
    end
    
    it 'shipping_area_idが空では保存できないこと' do
      @item.shipping_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include( "Shipping area can't be blank")
    end

    it 'shipping_area_idが1では保存できないこと' do
      @item.shipping_area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
    end

    it 'day_to_ship_idが空では保存できないこと' do
      @item.day_to_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include( "Day to ship can't be blank")
    end

    it 'day_to_ship_idが1では保存できないこと' do
      @item.day_to_ship_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Day to ship must be other than 1")
    end

    it 'priceが空では保存できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが英字のみでは登録できない" do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "priceが全角の数字だと登録できない" do
      @item.price = '３０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "priceが¥300より少ない時は出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが¥9999999より少ない時は出品できない" do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it '画像が空では投稿できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end 

    it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

    end
  end
end