class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :user_item, foreign_key:true
      t.string :postal_code,   null: false
      t.integer :prefecture_id,null: false
      t.string :municipality,  null: false
      t.string :address,       null: false
      t.string :building_name, null: false
      t.string :phone_number,  null: false
      t.timestamps
    end
  end
end