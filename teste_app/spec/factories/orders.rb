FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Descrição do pedido nº #{n}" }

    #deixando apenas "customer" o bot acha a fábrica dele e cria uma instância para o pedido
    association :customer, factory: :customer # = customer
  end
end
