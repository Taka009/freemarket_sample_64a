class Category < ApplicationRecord
  has_many :items
  has_ancestry
  # 入力
end
