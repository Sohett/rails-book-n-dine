class RestaurantsController < ApplicationController
  skip_before_action :authenticate_registration!, only: [:index, :show]
  before_action :set_restaurant, only: [:show, :edit, :destroy, :update]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @hash = Gmaps4rails.build_markers(@restaurant) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
    end
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    if @restaurant.save
      redirect_to user_path(current_user)
    else
      render 'form'
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to user_path(current_user)
    else
      render 'form'
    end
  end

  def destroy
    #code
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :municipality, :capacity, :category, :address, :user_id, photos: [])
  end

end
