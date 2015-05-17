# Base model for defining a post for housing
class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with CountryAndStateValidator
  validates :title,
            :post_type,
            :city,
            :country,
            :expiration,
            :validation,
            presence: true
  validates :email,
            email: true,
            confirmation: true,
            presence: true
  validates :email_confirmation,
            on: :create,
            presence: true

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
    using: { tsearch: { dictionary: "english" } }
  )

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode

  def toggle_show(show)
    update_attributes(
      show: show,
      expiration: Time.current.utc + 2.weeks
    )
  end

  def address
    [street, city, state, country].compact.join(", ")
  end
end
