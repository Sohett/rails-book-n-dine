class BookingsController < ApplicationController
  before_action :set_restaurant, only: [:booked_date, :show, :new, :create, :destroy]

  def show
    @booking = Booking.find(params.require(:id))
  end

  def new
    @available_booking = Booking.all - @restaurant.bookings
    @booking = Booking.new
  end

  def create
    unless current_user.last_name.nil? && current_user.first_name.nil?
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      @booking.restaurant = @restaurant
      @booking.status = "Booked !"
       #if booking does no exists then(depending on the date) the user can book, else, not possible to book
      if booked_date.include?(@booking.booking_date)
        flash[:alert] = 'The date you picked is already booked. Please choose another date!'
        render 'bookings/new', alert: "test"
        # render 'bookings/new' action: :new, :alert => "You haz errors!"
      else
        @booking.save
        redirect_to user_path(current_user), alert: "Your booking has been saved!"
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

  def booked_date
    booked = []
    @restaurant.bookings.each do |booking|
      booked << booking.booking_date
    end
    return booked
  end

  def set_restaurant
    @restaurant = Restaurant.find(params.require(:restaurant_id))
  end

  def booking_params
    params.require(:booking).permit(:status, :booking_date, :user_id, :restaurant_id)
  end
end
