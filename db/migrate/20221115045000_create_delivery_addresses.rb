class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string :post_code, null: false
      t.integer :delivery_area_id, null: false
      t.string :municipalities, null: false
      t.string :building, null: false
      t.string :telephone_number, null: false
      t.references :purchase_record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
