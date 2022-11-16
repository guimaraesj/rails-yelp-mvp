class Review < ApplicationRecord
  belongs_to :restaurant

  # A review must belong to a restaurant.
  validates_associated :restaurant

  # A review must have a content.
  # A review must have a rating.
  validates :content, :rating, presence: true

  # A review’s rating must be a number between 0 and 5.
  # A review’s rating must be an integer. For example, a review with a rating of 2.5 should be invalid!
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5, only_integer: true }
end
