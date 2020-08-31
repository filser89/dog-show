class Review < ApplicationRecord
  RATINGS = [1, 2, 3, 4, 5]
  validates :rating, presence: true, inclusion: { in: RATINGS }
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 30, too_short: "Your review should have at least %{count} characters" }

  belongs_to :user
  belongs_to :dog
end
