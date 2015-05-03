FactoryGirl.define do
  factory :post do
    title "Need couch in Berkeley"
    post_type :needed
    city "Berkeley"
    state "CA"
    country "USA"
    description "Need couch in Berkeley for two weeks"
    email "foo@bar.com"
    expiration { Time.current.utc + 2.weeks }
    validation "7c745b58bd4e49d81f117ab738f451f4"
  end
end
