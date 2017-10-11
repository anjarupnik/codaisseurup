FactoryGirl.define do
  factory :event do
    name              { Faker::Lorem.word }
    description       { Faker::Lorem.sentence(40) }
    location          "Amsterdam"
    price             { Faker::Commerce.price }
    capacity          3
    includes_food     true
    includes_drinks   true
    starts_at         20.days.from_now
    ends_at           30.days.from_now
    user              { build(:user) }


    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
