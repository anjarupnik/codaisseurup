FactoryGirl.define do
  factory :event do
    name              "Holy Shit"
    description       { Faker::Lorem.sentence(40) }
    location          "Amsterdam"
    price             2
    capacity          3
    includes_food     true
    includes_drinks   true
    starts_at         20.days.from_now
    ends_at           30.days.from_now
    price             { Faker::Commerce.price }
    user              { build(:user) }
    listing_name      { Faker::Lorem.sentence(1) }
    description       { Faker::Lorem.sentence(40) }
    address           { Faker::Address.city }
    user              { build(:user) }
    
    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
