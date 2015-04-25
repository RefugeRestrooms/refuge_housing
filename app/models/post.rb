# Base model for defining a post for housing
class Post < ActiveRecord::Base

  include PgSearch
  pg_search_scope :search, against: {
    :name => 'A',
    :street => 'B',
    :city => 'C',
    :state => 'D',
    :description => 'B',
    :country => 'D',
  },
  using: {tsearch: {dictionary: "english"}},
  ignoring: :accents

  validates :name, :street, :city, :state, presence: true

  geocoded_by :full_street_address
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode

  def full_street_address
      [street, city, state, country].compact.join(', ')
  end
end
