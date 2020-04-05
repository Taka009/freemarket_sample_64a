class AddPostageToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :postage, :integer
  end
end
