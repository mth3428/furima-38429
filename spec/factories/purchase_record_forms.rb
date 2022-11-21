FactoryBot.define do
  factory :purchase_record_form do
    post_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    delivery_area_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building { Faker::Address.street_address }
    telephone_number { Faker::Number.decimal_part(digits: 11) }
    token { "tok_abcdefghijk00000000000000000" }
    
  end
end
