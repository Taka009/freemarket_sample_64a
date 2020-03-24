class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name,           null: false
      t.text :description,      null: false
      t.references :user,       null: false,  foreign_key: true
      t.references :seller,     null: false,  foreign_key: { to_table: :users }
      t.references :buyer,      null: false,  foreign_key: { to_table: :users }
      t.references :category,   null: false,  foreign_key: true
      t.references :brand,      null: false,  foreign_key: true
      t.references :postage,    null: false,  foreign_key: true
      t.references :evaluation, null: false,  foreign_key: true
      t.integer :price,         null: false
      t.integer :condition,     null: false
      t.integer :dealing_stage, null: false
      t.integer :shipping_day,  null: false
      t.timestamps
    end
  end
end
