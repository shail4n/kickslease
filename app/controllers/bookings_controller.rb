class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(current_user == params[:user_id])
  end

  def new
    @booking = Booking.new
    @shoe = Shoe.find(params[:shoe_id])
    # @user = current_user
  end

  def create
    # raise
    @booking = Booking.create(booking_params)
    @booking.user = current_user
    @shoe = Shoe.find(params[:shoe_id])
    @booking.shoe = @shoe
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
