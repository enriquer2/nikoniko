FactoryGirl.define do
  factory :user_admin, class: User do
    name "sauron"
    lastname "dark"
    email "sauron@gmail.com"
    role 0
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
