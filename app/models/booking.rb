require 'date'

class Booking < ApplicationRecord
  belongs_to :unicorn
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :rating, inclusion: { in: (0..5),
  #   message: "%{value} should be included between 0 and 5" }

  def booking_duration
    (start_date - end_date).abs.to_i
  end

  def booking_price
    (booking_duration * unicorn.price * (1 + 0.05)).round(2)
  end
end
