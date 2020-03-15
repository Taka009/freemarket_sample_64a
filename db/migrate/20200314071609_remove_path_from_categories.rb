class RemovePathFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :path, :integer
    #入力
  end
end
