class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit]

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  def show
    @review = Review.new # acrescentado aqui para a refactored version (embebido no show)
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant) # or redirect_to @restaurant
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # to avoid ForbiddenAttributesError
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
