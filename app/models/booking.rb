class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  def start_time
    self.booking_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
