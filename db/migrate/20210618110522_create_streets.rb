class CreateStreets < ActiveRecord::Migration[6.0]
  def change
    create_table :streets do |t|
      t.string :address, null: false
      t.string   :postal_code,  null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
