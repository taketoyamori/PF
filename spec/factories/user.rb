FactoryBot.define do
  factory :user do
    name          { Faker::Name.name }
    email         { Faker::Internet.email }
    password      { "testpassword" }
    age           { Faker::Number.number(２) }
    introduction  { Faker::Lorem.characters(number:20) }
    image         { File.open('./app/assets/images/user_sample.jpg', ?r) }
    instagram     { "https://www.instagram.com"}
    twitter       { "https://twitter.com/" }
    line          { Faker::Lorem.characters(number:7) }
    is_deleted    { false }
  end
end