FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    full_name { Faker::Name.name }
    password { Faker::Internet.password }
  end

  factory :question do
    title { Faker::Company.catch_phrase }
    content { Faker::Lorem.paragraph }
    association :user
  end

  factory :answer do
    content { Faker::Lorem.sentence }
    association :user
    association :question
  end
end