class Evaluation < ApplicationRecord
  has_many :users, through: :evalutaions_users
  has_many :items
end
