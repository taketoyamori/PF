FactoryBot.define do
  factory :user do
    name          { Faker::Name.name }
    email         { Faker::Internet.email }
    password      { "password" }
    age           { 25 }
    introduction  { Faker::Lorem.characters(number:20) }
    profile_image { File.open('./app/assets/images/user_sample.jpg', ?r) }
    instagram     { "https://www.instagram.com" }
    twitter       { "https://twitter.com/" }
    line          { Faker::Lorem.characters(number:7) }
    is_deleted    { false }
  end
end