class PoolsController < ApplicationController

  before_action :set_pool, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  def index
    # # @restaurants = Restaurant.all
    # @restaurants = policy_scope(Restaurant)
    @pools = Pool.all
  end

  # GET /restaurants/1
  def show
    @booking = Booking.new
  end

  # GET /restaurants/new
  def new
    @pool = Pool.new
    # authorize @pool
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
    # authorize @pool

    if @pool.save
      redirect_to @pool, notice: 'Pool was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @pool.update(pool_params)
      redirect_to @pool, notice: 'Pool was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /restaurants/1
  def destroy
    @pool.destroy
    redirect_to pools_url, notice: 'Pool was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool
      @pool = Pool.find(params[:id])
      # authorize @pool
    end

    # Only allow a trusted parameter "white list" through.
    def pool_params

      params.require(:pool).permit(:dimensions, :description, :photo, :price, :address, :title)
    end
end
