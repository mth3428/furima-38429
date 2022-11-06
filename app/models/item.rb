class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition



  validates :item_name, :item_description, :price, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :item_condition_id, numericality: { other_than: 1 } 
end
