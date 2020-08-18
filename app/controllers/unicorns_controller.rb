class UnicornsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def show
    @unicorn = Unicorn.find(params[:id])
    @booking = Booking.new
  end
end
