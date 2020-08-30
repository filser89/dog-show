class User < ApplicationRecord
  has_many :dogs, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reviews_as_owner, through: :dogs, source: :reviews

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
end
