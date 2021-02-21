FactoryBot.define do
  factory :admin do
    email         { Faker::Internet.email }
    password      { "adminpassword" }
  end
end