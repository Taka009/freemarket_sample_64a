class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name,null: false
      t.integer :price, null: false
      t.references :brand
      t.references :category
      t.references :image
      t.timestamps
    end
  end
end
