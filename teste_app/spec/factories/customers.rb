FactoryBot.define do
    factory :customer, aliases: [:user] do
        # esse atributo não é passado para o teste. Precisa invocado caso necessitado
        transient do
            upcased { false }
            qtde_orders { 3 }
        end

        name { Faker::Name.name }
        #email { Faker::Internet.email(name: name) }
        #gender {['M', 'F', 'NB'].sample}

        address { Faker::Address.street_address }

        #cria uma sequencia de email (n+=1 toda vez que um objeto é criado)
        sequence(:email) do |n|
            "meu_email-#{n}@hotmail.com"
        end
        
        trait :male do
            gender {'M'}
        end

        trait :female do
            gender {'F'}
        end

        trait :NB do
            gender {'NB'}
        end

        trait :vip do
            vip { true }
            days_to_pay { 30 }
        end

        trait :default do
            vip { false }
            days_to_pay { 15 }
        end

        trait :with_orders do
            after(:create) do |customer, evaluator|
                create_list(:order, evaluator.qtde_orders, customer: customer)
            end
        end

        factory :customer_male, traits: [:male]
        factory :customer_female, traits: [:female]
        factory :customer_NB, traits: [:NB]
        factory :customer_vip, traits: [:vip]
        factory :customer_default, traits: [:default]
        factory :customer_male_vip, traits: [:male, :vip]
        factory :customer_female_vip, traits: [:female, :vip]
        factory :customer_NB_vip, traits: [:NB, :vip]
        factory :customer_male_default, traits: [:male, :default]
        factory :customer_female_default, traits: [:female, :default]
        factory :customer_NB_default, traits: [:NB, :default]

        after(:create) do |customer, evaluator|
            customer.name.upcase! if evaluator.upcased
        end
    end
end