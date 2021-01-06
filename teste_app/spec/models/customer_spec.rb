require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'Create a customer' do
    customer = create(:customer)
    expect(customer.saudacao).to eq("Bom dia Fulane")
  end
end
