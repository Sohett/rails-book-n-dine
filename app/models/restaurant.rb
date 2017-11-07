class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader

  validates :name, :municipality, :address, :capacity, presence: true
end
