class Postage < ApplicationRecord
  has_many :items
  has_ancestry
end
