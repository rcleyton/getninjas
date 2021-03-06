FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@test.com.br" }
    password { '000000' }
    role { :customer }

    trait :professional do
      role { :professional }
    end
  end
end