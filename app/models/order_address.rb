class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :address, :buliding_name, :phone_number,:user_id,:item_id,:token

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city 
    validates :address
    validates :phone_number,format:{with: /\A\d{10,11}\z/}
    validates :token
  end

  def save
  
    order = Order.create(item_id: item_id, user_id: user_id)

  
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, buliding_name: buliding_name,phone_number: phone_number ,order_id: order.id)
  end
end