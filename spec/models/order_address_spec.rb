require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
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
      @order_address.phone_number = '０８０−１２３４−１２３４'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end