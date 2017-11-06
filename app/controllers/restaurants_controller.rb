class RestaurantsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def index
    #code
  end

  def show
    #code
  end

  def new
    #code
  end

  def create
    #code
  end

  def destroy
    #code
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params########)
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :municipality, :capacity, :category, :address, :user_id)
  end

end
