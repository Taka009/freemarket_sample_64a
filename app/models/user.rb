class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_to :なんちゃかんちゃいずれ作る

  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 7 }, confirmation: true
  VALID_NAME_REGEX = /\A^[ぁ-んァ-ヶー一-龠]+$\z/
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  VALID_NAME_REGEX = /\A^[ぁ-んァ-ヶー一-龠]+$\z/
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  VALID_KANA_NAME_REGEX = /\A^[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/
  validates :kana_last_name, presence: true, format: { with: VALID_KANA_NAME_REGEX }
  VALID_KANA_NAME_REGEX = /\A^[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/
  validates :kana_first_name, presence: true, format: { with: VALID_KANA_NAME_REGEX }
  validates :birth_date, presence: true

end
