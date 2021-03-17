FactoryBot.define do
  factory :user_item do
    postal_code              {'123-4567'}
    prefecture_id            {2}
    municipality             {'千葉県'}
    address                  {'浦安'}
    building_name            {''}
    phone_number             {'09024747341'}

  end
end
