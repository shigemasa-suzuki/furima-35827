class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :day_to_ship


  with_options numericality: { other_than: 1 } do
  validates :category_id 
  validates :status_id
  validates :shipping_fee_id
  validates :shipping_area_id
  validates :day_to_ship_id
  end

  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :day_to_ship_id
    validates :image
  end

  validates  :price,  presence: true, format: {with: /\A[0-9]+\z/},numericality: { only_integer: true}
    {greater_than: 300, less_than: 10000000}

  
end
