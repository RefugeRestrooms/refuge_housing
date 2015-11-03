FactoryGirl.define do
  factory :post do
    title "Need couch in Berkeley"
    post_type :needed
    city "Berkeley"
    state "CA"
    country "US"
    description "Need couch in Berkeley for two weeks"
    email "foo@bar.com"
    email_confirmation "foo@bar.com"
    expiration { Time.current.utc + 2.weeks }
    validation "7c745b58bd4e49d81f117ab738f451f4"
    accuracy 2000
    latitude "37.8759471"
    longitude "-122.280622"
    show true

    factory :berkeley_post

    factory :boston_post do
      city "Boston"
      state "MA"
      latitude "42.3133735"
      longitude "-71.0571571"
    end

    factory :available_post do
      title "Have couch in Berkeley"
      description "Have couch in Berkeley for two weeks"
      post_type :available
    end

    factory :hidden_post do
      show false
    end
  end
end
