FactoryBot.define do
  factory :service do
    name                  { Faker::Name.name }
    description           { Faker::Lorem.sentence }
    category_id           { 2 }
    transportation_id     { 2 }
    prefecture_id         { 2 }
    duration_id           { 2 }
    price                 { 500 }

    association :user

    after(:build) do |service|
      service.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
