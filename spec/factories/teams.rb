FactoryGirl.define do
  factory :team do
    name { Faker::Name.last_name }

    factory :team1, class: Team do
    end
    factory :team2, class: Team do
    end
  end
end
