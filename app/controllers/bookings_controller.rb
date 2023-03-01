class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)

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

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
