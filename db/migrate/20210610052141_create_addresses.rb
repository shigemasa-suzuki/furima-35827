class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string   :postal_code,  null: false
      t.integer  :shipping_area_id,   null: false
      t.string   :city ,    null: false
      t.string   :address,   null: false
      t.string   :buliding_name      
      t.string   :phone_number,   null: false
      t.timestamps
      t.references :order, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
