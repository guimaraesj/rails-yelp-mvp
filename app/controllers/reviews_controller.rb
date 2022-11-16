class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    # new review with params
    @review = Review.new(review_params)
    # associate restaurant to review
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show', status: :unprocessable_entity
      # com o refactor, em vez de estar 'render :new', passou a estar este path
    end
  end

  private

  # to avoid ForbiddenAttributesError
  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_restaurant
    # encontrar restaurant. Aqui nos params temos que ir buscar o id do restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
