class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :item, null: false, foreign_key: true
      t.string :name, null: false
      t.timestamps
    end
  end
end
