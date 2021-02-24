FactoryBot.define do
  factory :post do
    title         { Faker::Lorem.characters(number:7) }
    body          { Faker::Lorem.characters(number:20) }
    post_image    { File.open('./app/assets/images/event_sample2.jpg', ?r) }
    admin
  end
end