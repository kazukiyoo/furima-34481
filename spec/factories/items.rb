FactoryBot.define do
  factory :item do
    product_name         {'Testname'}
    description          {'Testdescription'}
    price                {500}
    status_id            {2}
    prefecture_id        {2}
    burden_id            {2}
    days_to_delivery_id  {2}
    category_id          {2}
    user
    after(:build) do |dummy|
      dummy.image.attach(io: File.open('public/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
