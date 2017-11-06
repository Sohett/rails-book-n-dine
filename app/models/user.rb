class User < ApplicationRecord
  belongs_to :registration
  has_many :restaurants
  has_many :bookings
end
