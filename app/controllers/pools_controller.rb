class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index,]
  before_action :set_pool, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  def index
    # # @restaurants = Restaurant.all
    @pools = policy_scope(Pool)

    if params[:query].present?
      @pools = Pool.search_by_address(params[:query])
    else
      @pools = Pool.all
    end
    @pools = Pool.all
    @pools = Pool.where.not(latitude: nil, longitude: nil)
    @markers = @pools.map do |pool|
      {
        lat: pool.latitude,
        lng: pool.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end


  # GET /restaurants/1
  def show
    @markers = [{
        lat: @pool.latitude,
        lng: @pool.longitude
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }]
    @booking = Booking.new
  end

  # GET /restaurants/new
  def new
    @pool = Pool.new
    authorize @pool
  end

  # GET /restaurants/1/edit
  def edit
    authorize @pool
  end

  # POST /restaurants
  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
    authorize @pool

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
      authorize @pool
    end

    # Only allow a trusted parameter "white list" through.
    def pool_params

      params.require(:pool).permit(:dimensions, :description, :photo, :price, :address, :title)
    end
end
