class AddAncestryToPostages < ActiveRecord::Migration[5.0]
  def change
    add_column :postages, :ancestry, :string
    add_index :postages, :ancestry
  end
end
