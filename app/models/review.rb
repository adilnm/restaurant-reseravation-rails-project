class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  # Use of a scope method to avoid displaying empty reviews
  scope :non_empty_reviews, -> { where("content!=''") }

end
