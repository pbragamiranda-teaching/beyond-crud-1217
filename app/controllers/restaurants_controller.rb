class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy chef ]
  # before_action :set_restaurant, only: [ :show, :edit, :update, :destroy, :chef ]

  def top
    # Only restaurants with 5 stars
    @restaurants = Restaurant.where(rating: 5)
  end

  def chef 
    # @restaurant = Restaurant.find(params[:id])
    @chef_name = @restaurant.chef_name
  end

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: "Restaurant was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: "Restaurant was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end