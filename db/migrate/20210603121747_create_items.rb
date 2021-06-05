class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string   :name,        null: false
      t.text   :info,          null: false
      t.integer   :category_id,  null: false
      t.integer  :status_id,   null: false
      t.integer   :shipping_fee_id,    null: false
      t.integer   :shipping_area_id,   null: false
      t.integer   :day_to_ship_id,        null: false
      t.integer   :price,   null: false
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
