class BookingsController < ApplicationController


 def index
  @pool = Pool.find(params[:pool_id])
  @booking = Booking.all
end


def new
  @pool = Pool.find(params[:pool_id])
  @booking = Booking.new
end

def create
  @pool = Pool.find(params[:pool_id])
  @booking = Booking.new(booking_params)
  @booking.pool = @pool
  if @booking.save
    redirect_to pool_path(@pool)
  else
    render :new
  end
end

def destroy
  @pool = Pool.find(params[:id])
  @booking.destroy
  redirect_to pool_path(@booking.pool)
end

private

def booking_params
  params.require(:booking).permit(:date)
end


end
