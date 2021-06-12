require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address,user_id: @user.id,item_id: @item.id)
    sleep 0.1
  end

  context '内容に問題ない場合' do
    it "必須項目があれば保存ができること" do
      expect(@order_address).to be_valid
    end
    it 'buliding_nameは空でも保存できること' do
      @order_address.buliding_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では保存ができないこと" do
      @order_address.token = ' '
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'shipping_area_idを選択していないと保存できないこと' do
      @order_address.shipping_area_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが0桁以上11桁以内の半角数値のみ以外は保存できないこと' do
      @order_address.phone_number = '０８０１２３４１２３４５'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberに数字以外が混じっていた時は購入できないこと' do
      @order_address.phone_number = '080aaaaaaaa'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it "user_id（購入者）が空だと購入できない" do
      @order_address.user_id = ' '
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it "item_id（購入商品）が空だと購入できない" do
      @order_address.item_id = ' '
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end