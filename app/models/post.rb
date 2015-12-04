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
            :accuracy,
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
      neighborhood: "B",
      description: "B"
    },
    using: { tsearch: { dictionary: "english" } }
  )

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode if Rails.application.config.use_geocoder

  ACCURACIES = {
    "High" => 500,
    "Medium" => 2000,
    "Low" => 8000
  }.to_a

  def toggle_show(show)
    update_attributes(
      show: show,
      expiration: Time.current.utc + 2.weeks
    )
  end

  def address
    [street, city, state, postal_code, country].compact.join(", ")
  end

  def self.filter_type(type)
    if type.present?
      # TODO: For rails 5 we can just do post_type: type
      # (see: rails/rails#18387)
      where(post_type: post_types[type])
    else
      all
    end
  end

  def self.filter_near(location)
    if location.present?
      near(location)
    else
      all
    end
  end

  def self.filter_query(query)
    if query.present?
      search(query)
    else
      all
    end
  end

  def self.generate_validation
    require "securerandom"
    # a collision here has low probability, but might as well check
    loop do
      validation = SecureRandom.hex
      return validation if Post.find_by_validation(validation).nil?
    end
  end

  def self.create_default_params(init_params)
    init_params[:expiration] = (Time.current.utc + 1.day).iso8601
    init_params[:validation] = generate_validation
    init_params
  end
end
