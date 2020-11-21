FactoryBot.define do
  factory :user do
    nickname              { 'tarou' }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    name                  { '山田太郎' }
    name_reading          { 'ヤマダタロウ' }
    birthday              { '2000-01-01' }
  end
end