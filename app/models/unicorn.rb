class Unicorn < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  has_many_attached :photos

  MAGIC_POWERS = ["flying", "healing", "garden blooming", "yogi master", "fortune-telling"]

  validates :name, presence: true
  validates :magic_power, presence: true, inclusion: { in: MAGIC_POWERS,
      message: "%{value} is not a valid magic_power" }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [:location],
    using: {
      tsearch: { prefix: true }
    }
end
