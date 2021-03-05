FactoryBot.define do
  factory :user do
    nickname              {'Testname'}
    birthday              {'1998-02-20'}
    surname               {'山田'}
    first_name            {'太郎'}
    surname_kana          {'ヤマダ'}
    first_name_kana       {'タロウ'}
    email                 {Faker::Internet.free_email}
    password              {'aaa111'}
    password_confirmation {password}
  end
end