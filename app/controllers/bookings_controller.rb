class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings.all
  end
end
