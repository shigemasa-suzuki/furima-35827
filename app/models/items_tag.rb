class ItemsTag

  include ActiveModel::Model
  attr_accessor :tag, :name, :info, :category_id ,:status_id ,:shipping_fee_id,:shipping_area_id,:day_to_ship_id, :price, :user_id, :images


  with_options numericality: { other_than: 1 ,message: "--以外を入力して下さい"} do
  validates :category_id 
  validates :status_id
  validates :shipping_fee_id
  validates :shipping_area_id
  validates :day_to_ship_id
  end

  
  with_options presence: true do
    validates :name
    validates :info
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :day_to_ship_id
    validates :images
    validates :tag
  end

  validates  :price,  presence: true, format: {with: /\A[0-9]+\z/},numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  

  def save
    item = Item.create(name: name, info: info,category_id: category_id,status_id: status_id,shipping_fee_id: shipping_fee_id,shipping_area_id: shipping_area_id,day_to_ship_id: day_to_ship_id,price: price,user_id: user_id,images: images)
    tags = Tag.where(tag: tag).first_or_initialize
    tags.save

    ItemTagRelation.create(item_id: item.id, tag_id: tags.id)
  end
end