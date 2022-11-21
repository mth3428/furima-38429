class AddHouseNumberToDeliveryAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :delivery_addresses, :house_number, :string, null: false
  end
end
