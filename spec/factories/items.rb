FactoryBot.define do
  factory :item do
    name                         {'物'}
    info                         {'物事'}
    category_id                  { 3}
    status_id                    {3}
    shipping_fee_id              {3}
    shipping_area_id             {3}
    day_to_ship_id               {3}
    price                        {3000}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
