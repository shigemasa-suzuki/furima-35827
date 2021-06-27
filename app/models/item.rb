class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :day_to_ship


  with_options numericality: { other_than: 1 ,message: "--以外を入力して下さい"} do
  validates :category_id 
  validates :status_id
  validates :shipping_fee_id
  validates :shipping_area_id
  validates :day_to_ship_id
  end

  belongs_to :user
  has_one :order
  has_many_attached :images
  has_many :messages
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations
  has_one :item_order

  with_options presence: true do
    validates :name
    validates :info
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :day_to_ship_id
    validates :images
  end

  validates  :price,  presence: true, format: {with: /\A[0-9]+\z/},numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  
end
