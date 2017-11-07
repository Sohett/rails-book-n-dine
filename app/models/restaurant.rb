class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :municipality, :address, :capacity, presence: true
end
