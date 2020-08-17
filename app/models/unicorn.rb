class Unicorn < ApplicationRecord
  has_many :bookings
  belongs_to :user



  MAGIC_POWERS = ["flying", "healing", "garden blooming", "yogi master", "fortune-telling"]

  validates :name, presence: true
  validates :magic_power, presence: true, inclusion: { in: MAGIC_POWERS,
      message: "%{value} is not a valid magic_power" }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :location, presence: true

end
