class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :way_to_pay
  has_many :images, development :destroy
  acceots_nested_attributes_for :images, allow_destroy: true
end