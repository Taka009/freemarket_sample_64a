class Item < ApplicationRecord
  #  has_many :images, development: :destroy
  # accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  #  belongs_to_active_hash :condition_ls
   belongs_to :category
   belongs_to :images
  end
