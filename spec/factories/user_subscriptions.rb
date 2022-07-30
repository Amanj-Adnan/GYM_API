FactoryBot.define do
  factory :user_subscription do
    association :user
    monthly_remittance {Faker::Number.between(from: 200, to: 250)}
    start_date {'2022-01-01'}
    end_date {'2022-01-30'}
  end
end
