FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    password { '1a' + Faker::Internet.password(min_length: 7, max_length: 20) }
    email { Faker::Internet.email }
    birth_date { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
    first_name { '五時に' }
    last_name { '夢中' }
    first_name_kana { 'ゴジニ' }
    last_name_kana { 'ムチュウ' }
  end
end