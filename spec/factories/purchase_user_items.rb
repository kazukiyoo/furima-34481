FactoryBot.define do
  factory :purchase_user_item do
    postal_code              {'123-4567'}
    prefecture_id            {2}
    municipality             {2}
    address                  {'浦安'}
    building_name            {''}
    phone_number             {'09024747341'}
    user_id                  {1}
    item_id                  {1}
  end
end