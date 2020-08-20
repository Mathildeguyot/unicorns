class BookingsController < ApplicationController
  before_action :set_unicorn, only: [:create]
  before_action :set_booking, only: [:show, :destroy,:edit,:update]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def create
    @booking = Booking.new(params_booking.merge(user: current_user))
    @booking.unicorn = @unicorn

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "unicorns/show"
    end

  end

  def show
    # pundit sauf si booking.user = current_user
    @unicorn = @booking.unicorn
    @booking_duration = @booking.booking_duration
    @booking_price = @booking.booking_price
  end

  def edit
  end

  def update
    @booking.update(params_booking)
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end


  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_unicorn
    @unicorn = Unicorn.find(params[:unicorn_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
