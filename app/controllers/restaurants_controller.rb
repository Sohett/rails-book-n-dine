class RestaurantsController < ApplicationController
  skip_before_action :authenticate_registration!, only: [:index, :show]
  before_action :set_restaurant, only: [:show, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    @restaurant.save!
    redirect_to user_path(current_user)
  end

  def destroy
    #code
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :municipality, :capacity, :category, :address, :user_id, :photo)
  end

end
