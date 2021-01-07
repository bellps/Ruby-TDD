require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to' do
    customer = create(:customer)

    #quiser, pode passar um customer pra ele
    order = create(:order, customer: customer)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Tem 3 pedidos --create_list' do
    #cria uma lista de pedidos
    orders = create_list(:order, 3) #podemos sobrescrever atributos por aqui também -> , description: "testesssss"
    #puts orders.inspect
    expect(orders.count).to eq(3)
  end

  it 'Tem 2 pedidos --create_pair' do
    #cria uma lista de pedidos
    orders = create_pair(:order)
    #puts orders.inspect
    expect(orders.count).to eq(2)
  end

  it 'has_many' do
    customer = create(:customer, :with_orders, qtde_orders: 5)
    # puts customer.inspect
    # puts customer.orders.inspect
    expect(customer.orders.count).to eq(5)
  end
end
