class Item < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  belongs_to :postage
  belongs_to :user
  belongs_to :evaluation
  has_many :images
  has_many :goods
  enum condition: [ :unused, :near_unused, :no_scratch, :slightly_scratched, :scratched, :shoddy]
  enum shipping_day: [ :1_2, :2_3, :4_7]
  enum dealing_stage: [ :exhibiting, :trading, :sold]
end
