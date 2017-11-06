class BookingsController < ApplicationController
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

  def set_booking
    @booking = Booking.find(params########)
  end

  def booking_params
    params.require(:booking).permit(:status, :booking_date, :user_id, :restaurant_id)
  end
end
