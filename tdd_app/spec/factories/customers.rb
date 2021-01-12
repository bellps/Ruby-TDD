FactoryBot.define do
    factory :customer do
        name { Faker::Name.name }
        email { Faker::Internet.email(name: name) }
        phone { Faker::PhoneNumber.phone_number }
        avatar { "#{Rails.root}/spec/fixtures/avatar.png" }
        smoker { ['S', 'N'].sample }
    end
end