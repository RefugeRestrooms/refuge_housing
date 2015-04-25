# Base model for defining a post for housing
class Post < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search, against: {
    name: "A",
    street: "B",
    city: "C",
    state: "D",
    neighborhood: "B",
    description: "B",
    country: "D"
  },

  using: { tsearch: { dictionary: "english" } },
  ignoring: :accents

  validates :name, :city, :state, presence: true

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode

  def address
    addr = [street, city, state, country].compact.join(", ")
    addr = [addr, street].compact.join(", ") if street
    addr
  end
end
