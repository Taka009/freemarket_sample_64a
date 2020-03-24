class AddParentIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :parent_id, :string
  end
end
