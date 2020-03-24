class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # アソシエーション
  has_one :place
  has_many :items
  has_many :goods
  has_many :evaluations, through: :evalutaions_users
  has_many :credits
  # has_many :sells
  # has_many :buys

  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 7 }, confirmation: true
  VALID_LAST_NAME_REGEX = /\A^[ぁ-んァ-ヶー一-龠]+$\z/
  validates :last_name, presence: true, format: { with: VALID_LAST_NAME_REGEX }
  VALID_FIRST_NAME_REGEX = /\A^[ぁ-んァ-ヶー一-龠]+$\z/
  validates :first_name, presence: true, format: { with: VALID_FIRST_NAME_REGEX }
  VALID_KANA_LAST_NAME_REGEX = /\A^[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/
  validates :kana_last_name, presence: true, format: { with: VALID_KANA_LAST_NAME_REGEX }
  VALID_KANA_FIRST_NAME_REGEX = /\A^[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/
  validates :kana_first_name, presence: true, format: { with: VALID_KANA_FIRST_NAME_REGEX }
  validates :birth_date, presence: true

end
