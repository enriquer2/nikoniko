FactoryGirl.define do
  factory :user_admin, class: User do
    name {Faker::Name.name}
    lastname {Faker::Name.last_name}
    email {Faker::Internet.email}
    role 0
    password {Faker::Internet.password}
  end
  factory :user_boss, class: User do
    name "legolas"
    lastname "arrow"
    email "legolas@gmail.com"
    role 1
  end
  factory :user_employer, class: User do
    name "frodo"
    lastname "ring"
    email "frodo@gmail.com"
    role 3
  end
end
