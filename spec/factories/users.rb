FactoryGirl.define do
  factory :user do
    name { Faker::Name.last_name }
    lastname { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    factory :admin, class: User do
      role 'admin'
      team_id { create(:team).id }
    end
    factory :boss, class: User do
      role 'boss'
      team_id { create(:team).id }
    end
    factory :teamleader, class: User do
      role 'teamleader'
      team_id { create(:team).id }
    end
    factory :employee, class: User do
      role 'employee'
      team_id { create(:team).id }
    end
  end
end
