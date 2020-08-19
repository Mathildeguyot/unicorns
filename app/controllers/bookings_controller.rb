class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings.all
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user = current_user
    @booking.unicorn = Unicorn.find(params[:id])

    @booking.save

  end

  private

  def params_unicorn
    params.require(:booking).permit(:start_date, :end_date, :user, :unicorn)
  end

end
