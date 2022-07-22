FactoryBot.define do
  factory :user_info do
    gender {Faker::Gender.binary_type }
    birth_date {Faker::Date.between(from: '1999-01-01', to: '2004-01-01')}
    mobile_number {Faker::PhoneNumber.cell_phone_in_e164}
    height {Faker::Number.between(from: 165, to: 200)}
    weight {Faker::Number.between(from: 60, to: 250)}
  end
end
