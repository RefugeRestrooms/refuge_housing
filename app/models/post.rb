# Base model for defining a post for housing
class Post < ActiveRecord::Base
  enum post_type: { needed: 0, available: 1 }

  scope :active, -> do
    where(show: true).where("expiration >= ?", Time.current.utc)
  end

  include PgSearch
  pg_search_scope(
    :search,
    against: {
      title: "A",
      street: "B",
      city: "C",
      state: "D",
      neighborhood: "B",
      description: "B",
      country: "D"
    },
    using: { tsearch: { dictionary: "english" } },
    ignoring: :accents
  )

  validates :title,
            :post_type,
            :city,
            :state,
            :country,
            :email,
            :expiration,
            :validation,
            presence: true

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode

  def address
    [street, city, state, country].compact.join(", ")
  end
end
