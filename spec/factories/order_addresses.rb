FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipping_area_id { 1 }
    city { '東京都' }
    address { '1-1' }
    buliding_name { '東京ハイツ' }
    phone_number { 12312341234 }
    #order_id{10}
    user_id{2}
    item_id{8}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
