class BookingsController < ApplicationController
  before_action :set_restaurant, only: [:show, :new, :create, :destroy]

  def show
    @booking = Booking.find(params.require(:id))
  end

  def new
    @booking = Booking.new
  end

  def create
    unless current_user.last_name.nil? && current_user.first_name.nil?
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      @booking.restaurant = @restaurant
      @booking.status = "Booked !"
      if @booking.save
        redirect_to user_path(current_user)
      else
        render 'bookings/new'
      end
    else
      redirect_to edit_user_path(current_user), alert: "Please complete your profile before booking "
    end
  end

  def destroy
    @booking = Booking.find(params.require(:id))
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params.require(:restaurant_id))
  end

  def booking_params
    params.require(:booking).permit(:status, :booking_date, :user_id, :restaurant_id)
  end
end
