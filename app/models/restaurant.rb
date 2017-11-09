class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_attachments :photos, maximum: 4

  validates :name, :municipality, :address, :capacity, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
