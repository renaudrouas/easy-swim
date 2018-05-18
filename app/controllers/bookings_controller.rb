class BookingsController < ApplicationController
before_action :set_booking, only: [:show, :edit, :update, :destroy]


  def index

    @reservations = []
    Pool.where(user_id: current_user).each do |pool|
      pool_ids = pool.id
      Booking.where(pool_id: pool_ids).each do |booking|
        @reservations << booking
      end
    end
    @my_reservations = current_user.bookings

    @bookings = policy_scope(Booking)
    if user_signed_in?
      @bookings = current_user.bookings
    else
      redirect_to user_session_path
    end



if params[:query].present?
      @pools = policy_scope(Pool.search_by_title_and_address(params[:query]))

      @pools_geo = @pools.where.not(latitude: nil, longitude: nil)
    else
      @pools = policy_scope(Pool)
    # raise
    @pools_geo = Pool.where.not(latitude: nil, longitude: nil)
    end

    @markers = @pools_geo.map do |pool|
     {
       lat: pool.latitude,
             lng: pool.longitude#,
             # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
           }
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
