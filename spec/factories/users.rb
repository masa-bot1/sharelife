FactoryBot.define do
  factory :user do
    nickname              { 'tarou' }
    email                 { Faker::Internet.free_email }
    password              { 'password1' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '2000-01-01' }
    category_id           { 2 }
  end
end
