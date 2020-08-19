class Booking < ApplicationRecord
  belongs_to :unicorn
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :rating, inclusion: { in: (0..5),
    message: "%{value} should be included between 0 and 5" }
end
