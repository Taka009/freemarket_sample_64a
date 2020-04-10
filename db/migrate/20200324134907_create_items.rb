class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name,           null: false
      t.text :description,      null: false
      t.references :user,       null: false,  foreign_key: true
      t.references :seller,     null: false,  foreign_key: { to_table: :users }
      # t.references :buyer,      foreign_key: { to_table: :users }
      t.references :category,   null: false,  foreign_key: true
      t.references :brand,      foreign_key: true
      t.references :postage,    null: false
      #t.references :evaluation, #null: false,  foreign_key: true
      t.integer :price,         null: false
      t.references :condition,     null: false
      # t.integer :dealing_stage, null: false
      t.references :shipping_day,  null: false
      t.references :shippingpayer, null: false
      t.timestamps
    end
  end
end
