FactoryBot.define do
  factory :user do
    email         { Faker::Internet.email }
    password      { "adminpassword" }
  end
end