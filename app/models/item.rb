class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :user, presence: true
  validates :seller_id, presence: true
  validates :category_id, presence: true, exclusion: { in: [0,1,2,6,9,10,14]}
  validates :postage_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_day_id, presence: true
  validates :shippingpayer_id, presence: true
  validates :images, presence: true
  validates :price, presence: true
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :conditionls
    belongs_to_active_hash :shippingpayerls
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :shippingduration
    belongs_to_active_hash :status
end
