class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_date


  validates :item_name, :item_description, :image, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :item_condition_id, numericality: { other_than: 1 } 
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :delivery_date_id, numericality: { other_than: 1 }

  with_options presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
    validates :price
  end
end
