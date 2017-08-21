FactoryGirl.define do
  factory :feeling do
    status { Feeling.statuses.values.sample }
    day { Faker::Date.between(3.days.ago, Date.today) }
  end
end
