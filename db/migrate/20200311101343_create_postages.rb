class CreatePostages < ActiveRecord::Migration[5.0]
  def change
    create_table :postages do |t|
      t.string :way_to_pay, null: false
      t.string :how_to_send, null: false
      t.string :Delivery_days, null: false
      t.timestamps
      #EEEEE
    end
  end
end
