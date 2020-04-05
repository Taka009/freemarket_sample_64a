class AddShippingpayerToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :shippingpayer, :integer
  end
end
