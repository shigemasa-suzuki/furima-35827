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
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it 'infoが空では保存できないこと' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it 'category_idが空では保存できないこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end

    it 'category_idが1では保存できないこと' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリー--以外を入力して下さい")
    end

    it 'status_idが空では保存できないこと' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を入力してください")
    end

    it 'status_idが1では保存できないこと' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態--以外を入力して下さい")
    end

    it 'shipping_fee_idが空では保存できないこと' do
      @item.shipping_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end

    it 'shipping_fee_idが1では保存できないこと' do
      @item.shipping_fee_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担--以外を入力して下さい")
    end
    
    it 'shipping_area_idが空では保存できないこと' do
      @item.shipping_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include( "発送元の地域を入力してください")
    end

    it 'shipping_area_idが1では保存できないこと' do
      @item.shipping_area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域--以外を入力して下さい")
    end

    it 'day_to_ship_idが空では保存できないこと' do
      @item.day_to_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include( "発送までの日数を入力してください")
    end

    it 'day_to_ship_idが1では保存できないこと' do
      @item.day_to_ship_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数--以外を入力して下さい")
    end

    it 'priceが空では保存できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格を入力してください")
    end
    it "priceが英字のみでは登録できない" do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
    end

    it "priceが全角の数字だと登録できない" do
      @item.price = '３０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
    end

    it "priceが¥300より少ない時は出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
    end

    it "priceが¥9999999より少ない時は出品できない" do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
    end

    it '画像が空では投稿できない' do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end 

    it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Userを入力してください")
    end

    end
  end
end