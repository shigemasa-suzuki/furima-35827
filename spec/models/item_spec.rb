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
      expect(@item.errors.full_messages).to include("Category is not a number", "Category can't be blank")
    end

    it 'status_idが空では保存できないこと' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status is not a number", "Status can't be blank")
    end

    it 'shipping_fee_idが空では保存できないこと' do
      @item.shipping_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee is not a number", "Shipping fee can't be blank")
    end

    it 'shipping_area_idが空では保存できないこと' do
      @item.shipping_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area is not a number", "Shipping area can't be blank")
    end

    it 'day_to_ship_idが空では保存できないこと' do
      @item.day_to_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Day to ship is not a number", "Day to ship can't be blank")
    end

    it 'priceが空では保存できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is too short (minimum is 3 characters)", "Price is not a number")
    end
    it "priceが英字のみでは登録できない" do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is too short (minimum is 3 characters)", "Price is not a number")
    end

    it "priceが全角の数字だと登録できない" do
      @item.price = '３０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is too short (minimum is 3 characters)", "Price is not a number")
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