class CreateGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :goods do |t|
      t.references :user,  foreign_key: true, null: false
      t.references :item,  foreign_key: true, null: false
      t.string :good,     null: false
      t.timestamps
    end
  end
end
