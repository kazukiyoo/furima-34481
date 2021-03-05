class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key:true
      t.string :product_name
      t.integer :price
      t.text :description
      t.integer :category_id
      t.integer :status_id
      t.integer :prefecture_id
      t.integer :burden_id
      t.integer :days_to_delivery_id
      t.timestamps
    end
  end
end
