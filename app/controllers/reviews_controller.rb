class ReviewsController < ApplicationController
  before_action :set_restaurant

  def new
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    # Find restaurant related to the review
    # @restaurant = Restaurant.find(params[:restaurant_id])
    # I need to say that this review belongs to some restaurant
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end
  
  private
  
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
