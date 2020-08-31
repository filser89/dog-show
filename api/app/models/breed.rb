class Breed < ApplicationRecord
  validates :breed_category, presence: true
  has_many :dogs

  def to_s
    subbreed ? "#{subbreed.capitalize} #{breed_category.capitalize}" : breed_category.capitalize
  end
end
