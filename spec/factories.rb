FactoryBot.define do
factory :review do
  name { Faker::Movies::HarryPotter.character }
  test_body { Faker::Movies::HarryPotter.spell }
  destination
end

factory :destination do
  destination { Faker::Movies::HarryPotter.location }
  city { Faker::Address.city }
  country { Faker::Address.country }

  factory :destination_with_reviews do
    transient do
      reviews_count { 5 }
    end

    after(:create) do |destination, evaluator|
        create_list(:review, evaluator.reviews_count, destination: destination)
      end
    end
  end
end
