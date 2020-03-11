class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_to :なんちゃかんちゃいずれ作る

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true

end
