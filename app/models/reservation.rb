class Reservation < ApplicationRecord
  validates :date, :time, presence: true
  validate :expiration_date_cannot_be_in_the_past
  def expiration_date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
  belongs_to :restaurant
  belongs_to :user
end
