class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :large, null: false
      t.string :midium, null: false
      t.string :small
      t.string :size
      t.string :brand
      t.timestamps
    end
  end
end
