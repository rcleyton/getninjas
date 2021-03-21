FactoryBot.define do
  factory :profile do
    user_id { 1 }
    name { 'Jonh Doe' }
    phone { '11 99999-9999' }
    city { 'São Paulo' }
    neighborhood { 'Pinheiros' }
    street { 'Av. Rebouças' }
    zip_code { '05402-300' }
    state { 'SP' }
  end
end
