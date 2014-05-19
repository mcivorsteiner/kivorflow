FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    full_name { Faker::Name.name }
    password { Faker::Internet.password }
  end

  factory :question do
    title { Faker::Company.catch_phrase }
    content { Faker::Lorem.paragraph }
  end

  factory :answer do
    content { Faker::Lorem.sentence }
  end
end