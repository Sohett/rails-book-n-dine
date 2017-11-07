class BookingsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def index
  end

  def show
  end

  def new
    @booking = Booking.new
    @restaurant = Restaurant.find(params.require(:restaurant_id))
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @restaurant = Restaurant.find(params.require(:restaurant_id))
    @booking.restaurant = @restaurant
    @booking.status = "Booked !"
    if @booking.save
      redirect_to user_path(current_user)
    else
      raise
    end
  end

  def destroy
    #code
  end

  private

  def set_booking
    @booking = Booking.find(params(:id))
  end

  def booking_params
    params.require(:booking).permit(:status, :booking_date, :user_id, :restaurant_id)
  end
end
