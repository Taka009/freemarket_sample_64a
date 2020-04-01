class Item < ApplicationRecord
  has_many :images, development :destroy
  acceots_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition_ls
end
