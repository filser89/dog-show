class Dog < ApplicationRecord
  valiates :name, presence: true
  belongs_to :user
  belongs_to :breed
  has_many :reviews, dependent: :destroy
end
