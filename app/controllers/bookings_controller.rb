class BookingsController < ApplicationController
  before_action :set_unicorn, only: [:create]
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = current_user.bookings.all
  end

  def create
    @booking = Booking.new(params_booking.merge(user: current_user))
    @booking.unicorn = @unicorn

    if @booking.save
      redirect_to root_path
    else
      render "unicorns/show"
    end

  end

  def show
    @unicorn = @booking.unicorn

    # /!\ checker format start_date & end_date
    # créer une fondtion total_days dans model booking ?
    #  @booking_total_days = @booking.start_date - @booking.end_date


    # créer une fontion booking_price dans model booking ?
    # @booking_price = @booking.unicorn.price * @total_days + @booking.unicorn.price * @total_days * 0.05
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
