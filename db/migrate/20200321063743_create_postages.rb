class CreatePostages < ActiveRecord::Migration[5.0]
  def change
    create_table :postages do |t|
      t.string :name
      t.integer :path
    end
  end
end
