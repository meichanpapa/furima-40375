FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 1)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    last_name             {'ひらがなカタカナヴヵヶー'}
    first_name            {'漢字々'}
    last_name_kana        {'ヴヵヶ'}
    first_name_kana       {'カタカナー'}
    birthdate             {Faker::Date.between(from: '1930-01-01', to: '2019-12-31')}
  end
end