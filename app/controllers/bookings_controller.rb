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
    @reservations = []
    @pools_reserved = []
      Pool.where(user_id: current_user).each do |pool|
      pool_ids = pool.id
      Booking.where(pool_id: pool_ids).each do |booking|
      @user = User.find(booking.user_id)
        if booking.user_id != nil
          @reservations << booking
          @pools_reserved << pool
        end
      end
      end
    @pools_booked = []
      @bookings = Booking.where(user_id: current_user)
      @bookings.each do |booking|
        owner_id = Pool.find(booking.pool_id).user_id
        @owner = User.find(owner_id)
        @pools_booked << Pool.find(booking.pool_id)
      end

    @bookings = policy_scope(Booking)
    if user_signed_in?
      @bookings = current_user.bookings
    else
      redirect_to user_session_path
    end

    # -------------------------------------------------------------------------
    #   @bookings = Booking.where(user_id: current_user)
    # # end
    # #raise
    # @bookings = policy_scope(Booking)
    # if user_signed_in?
    #   @bookings = current_user.bookings
    # else
    #   redirect_to user_session_path
    # end
    # -------------------------------------------------------------------------

  #Booking.joins(:users).where("posts.created_at < ?", Time.now)

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
