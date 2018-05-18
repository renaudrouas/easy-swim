class BookingsController < ApplicationController
before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    #@pool = Pool.find(params[:pool_id])
    # if current_user == @pool.user_id
    #   @pool = Pool.where(user_id: current_user)
    #   @pool.each do |pool|
    #   @pool_id = pool.pool_id
    #   @bookings = Booking.find(pool_id: @pool_id)
    #   end
    # else
      @bookings = Booking.where(user_id: current_user)
    # end
    #raise
    @bookings = policy_scope(Booking)
    if user_signed_in?
      @bookings = current_user.bookings
    else
      redirect_to user_session_path
    end

  #Booking.joins(:users).where("posts.created_at < ?", Time.now)

  end


  # def confirm_status
  #   @booking = Booking.find(params[:booking_id])
  #   @booking.update(status: "Confirmed")
  #   if @booking.save
  #     redirect_to my_properties_path
  #   else
  #     flash[:alert] = "Could not confirm"
  #     render my_properties_path
  #   end
  # end

  # def decline_status
  #   @booking = Booking.find(params[:booking_id])
  #   @booking.update(status: "Declined")
  #   if @booking.save
  #     redirect_to my_properties_path
  #   else
  #     flash[:alert] = "Could not confirm"
  #     render my_properties_path
  #   end
  # end

  def create
    if user_signed_in?
      @pool = Pool.find(params[:pool_id])
      @booking = Booking.new(booking_params)
      authorize @booking
      @booking.pool = @pool
      @booking.user = current_user

    # @booking.status = "Pending"
    if @booking.save
      redirect_to pool_bookings_path
    else
      render "pools/show"
      # redirect_to user_session_path
    end
  # else
  #   redirect_to user_session_path
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
