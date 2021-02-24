FactoryBot.define do
  factory :event do
    title         { Faker::Lorem.characters(number:7) }
    introduction  { Faker::Lorem.characters(number:20) }
    event_image   { File.open('./app/assets/images/event_sample2.jpg', ?r) }
    date          { "2020/02/01" }
    user
    prefecture
  end
end