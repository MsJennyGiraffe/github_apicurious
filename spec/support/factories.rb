FactoryGirl.define do
  factory :user do
    name     { Faker::Name.name }
    email    { Faker::Internet.email }
    username { Faker::Internet.user_name }
    avatar   { Faker::Avatar.image(name) }
  end
end
