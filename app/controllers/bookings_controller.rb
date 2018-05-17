class BookingsController < ApplicationController
before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking)
    if user_signed_in?
      @bookings = current_user.bookings
    else
      redirect_to user_session_path
    end
  end


  def confirm_status
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: "Confirmed")
    if @booking.save
      redirect_to my_properties_path
    else
      flash[:alert] = "Could not confirm"
      render my_properties_path
    end
  end

  def decline_status
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: "Declined")
    if @booking.save
      redirect_to my_properties_path
    else
      flash[:alert] = "Could not confirm"
      render my_properties_path
    end
  end

  def create
    if user_signed_in?
      @pool = Pool.find(params[:pool_id])
      @booking = Booking.new(booking_params)
      authorize @booking
      @booking.pool = @pool
      @booking.user = current_user

    # @booking.status = "Pending"
    if @booking.save
      redirect_to pools_path
    else
      render "pools/show"
    end
  else
    redirect_to user_session_path
  end
end

private

    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      authorize @booking
    end


def booking_params
  params.require(:booking).permit(:date)
end


end
