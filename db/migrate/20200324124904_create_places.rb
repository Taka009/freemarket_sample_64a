class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
    t.references  :user,            null: false, foreign_key: true
    t.integer     :postalcodes,     null: false
    t.string      :prefectures,     null: false
    t.string      :municipalities,  null: false
    t.string      :numbers,         null: false
    t.string      :buildings
    t.integer     :emergency_contact, unique: true
    t.timestamps
    end
  end
end
