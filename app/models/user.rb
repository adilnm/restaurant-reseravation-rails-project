class User < ApplicationRecord
  validates :name, :age, :email,:phone, :password, presence: true
  validates :email, uniqueness: true
  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :email, format: { with: /.*@.*/}
  validates :phone, numericality: { only_integer: true }
  has_secure_password
  has_many :reviews
  has_many :restaurants, through: :reviews
  has_many :reservations
  has_many :restaurants, through: :reservations
end
