class PurchaseRecordForm
  include ActiveModel::Model
  atter_accessor :item_id, :user_id, :post_code, :delivery_area, :municipalities, :house_number, :building, :telephone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :delivery_area_id,numericality: { other_than: 1}
    validates :municipalities
    validates :house_number
    validates :telephone_number, format: {with: ^0[0-9]{9,10}$}
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    DeliveryAddress.create(purchase_record_id: purchase_record_id, post_code: post_code, delivery_area_id: delivery_area_id, municipalities: municipalities, house_number: house_number, building: building, telephone_number: telephone_number)
  end

end