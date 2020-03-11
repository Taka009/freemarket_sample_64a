class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.name :string
      t.description :string
      t.integer :prace
      t.timestamps
    end
  end
end
