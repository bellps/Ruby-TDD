require 'rails_helper'

RSpec.describe Customer, type: :model do
  #nas fixures criamos meio que "seeds" para os testes
  fixtures :all

  it 'Create a customer' do
    customer = customers(:fulane)

    expect(customer.saudacao).to eq("Bom dia Fulane da Silva")
  end
end
