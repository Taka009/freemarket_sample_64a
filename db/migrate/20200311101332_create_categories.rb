class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :large
      t.string :midium
      t.string :small
      t.string :size
      t.string :brand
      t.timestamps
    end
  end
end
