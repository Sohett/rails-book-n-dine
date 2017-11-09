class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_attachments :photos, maximum: 4

  validates :name, :municipality, :address, :capacity, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(query)
    if query.to_i != 0
      query = query.to_i
    end

    restaurants_results = []
    restaurant_name = []
    restaurant_municipality = []
    restaurant_category = []
    restaurant_capacity = []

    if query.is_a? Integer
      restaurant_capacity = where("capacity > #{query}")
    else
      restaurant_name = where("name LIKE ?", "%#{query}%")
      restaurant_municipality = where("municipality LIKE ?", "%#{query}%")
      restaurant_category = where("category LIKE ?", "%#{query}%")
    end

    unless restaurant_name.nil?
      restaurants_results += restaurant_name
    end

    unless restaurant_capacity.nil?
      restaurants_results += restaurant_capacity
    end

    unless restaurant_municipality.nil?
      restaurants_results += restaurant_municipality
    end

    unless restaurant_category.nil?
      restaurants_results += restaurant_category
    end

    return restaurants_results.uniq
  end

end
