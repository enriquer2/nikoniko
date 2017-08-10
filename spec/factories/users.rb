# frozen_string_literal: true

FactoryGirl.define do
  factory :admin, class: User do
    name { Faker::Name.last_name }
    lastname { Faker::Name.name }
    email { Faker::Internet.email }
    role 0
    password { Faker::Internet.password }
  end
  factory :boss, class: User do
    name { Faker::Name.last_name }
    lastname { Faker::Name.name }
    email { Faker::Internet.email }
    role 1
    password { Faker::Internet.password }
  end
  factory :employer, class: User do
    name { Faker::Name.last_name }
    lastname { Faker::Name.name }
    email { Faker::Internet.email }
    role 3
    password { Faker::Internet.password }
  end
end
