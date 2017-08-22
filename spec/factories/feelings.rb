FactoryGirl.define do
  factory :feeling do
    status { Feeling.statuses.keys.sample }
    day { Faker::Date.between(3.days.ago, Date.today) }

    factory :f_admin, class: Feeling do
      user_id { create(:admin).id }
    end
    factory :f_boss, class: Feeling do
      user_id { create(:boss).id }
    end
    factory :f_teamleader, class: Feeling do
      user_id { create(:teamleader).id }
    end
    factory :f_employee, class: Feeling do
      user_id { create(:employee).id }
    end
  end
end
