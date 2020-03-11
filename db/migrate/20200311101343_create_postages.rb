class CreatePostages < ActiveRecord::Migration[5.0]
  def change
    create_table :postages do |t|

      t.string :way_to_pay
      t.string :how_to_send

      t.timestamps
    end
  end
end
