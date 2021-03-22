FactoryBot.define do
  factory :order do
    question_1 { "Automóvel" }
    question_2 { "Funilaria" }
    question_3 { "Pintura" }
    latitude { 1.5 }
    longitude { 1.5 }

    association :profile
  end
end
