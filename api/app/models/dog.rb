class Dog < ApplicationRecord
  GENDERS = ['male', 'female']
  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 192, greater_than_or_equal_to: 0 }
  validates :gender, presence: true, inclusion: { in: GENDERS }
  belongs_to :user
  belongs_to :breed
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
end
