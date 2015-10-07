class CountryAndStateValidator < ActiveModel::Validator
  def validate(record)
    unless country_is_valid(record.country)
      record.errors[:country] << "is not valid"
      return false
    end

    unless state_is_valid(record.country, record.state)
      record.errors[:state] << "is not valid"
      return false
    end
  end

  private

  def country_is_valid(country)
    ISO3166::Country[country].present?
  end

  # True only if the country:
  # - has no subdivisions, OR
  # - has a valid subdivision for the country
  def state_is_valid(country, state)
    ISO3166::Country[country].subdivisions.blank? ||
      ISO3166::Country[country].subdivisions[state].present?
  end
end
