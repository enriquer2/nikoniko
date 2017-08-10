# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    name { Faker::Name.last_name }
    lastname { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    factory :admin, class: User do
      role 'admin'
    end
    factory :boss, class: User do
      role 'boss'
    end
    factory :teamleader, class: User do
      role 'teamleader'
    end
    factory :employee, class: User do
      role 'employee'
    end
  end
end
