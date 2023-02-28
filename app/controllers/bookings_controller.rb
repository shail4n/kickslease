class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(current_user == params[:user_id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Boooking.new(booking_params)
    @shoe = Shoe.find(params[:id])
    @booking.shoe = @shoe
    if @booking.save
      redirect_to bookings_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(@booking).permit(:start_date, :end_date)
  end

end
