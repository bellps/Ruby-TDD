FactoryBot.define do
  factory :member do
    email { Faker::Internet.email}
    password { '123456' }
  end
end
