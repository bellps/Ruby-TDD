require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#saudação' do
    customer = create(:customer)
    puts customer.email
    expect(customer.saudacao).to starting_with("Bom dia")
  end

  it 'Sobrescrevendo o nome' do
    customer = create(:user, name: "Ednaldo Pereira")
    puts customer.email
    expect(customer.saudacao).to eq("Bom dia Ednaldo Pereira")
  end

  it 'Herança' do
    customer = create(:customer_vip)
    #se eu passar só o :customer aqui vai dar erro, pois ele não tem o vip
    expect(customer.vip).to be_truthy
  end

  it 'Usando attributes_for' do
    #traz só um hash com os atributos
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.saudacao).to starting_with("Bom dia")
  end

  it 'Atributo transitório' do
    customer = create(:customer, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente masculino vip' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to be_truthy
  end

  it 'Cliente não-binário vip' do
    customer = create(:customer_NB_vip)
    expect(customer.gender).to eq('NB')
    expect(customer.vip).to be_truthy
  end

  it '#travel_to' do
    #cria o usuário em 2004
    travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
      @customer = create(:customer_vip)
    end

    #expect(@customer.created_at).to eq(Time.new(2004, 11, 24, 01, 04, 44, "+00:00"))
    expect(@customer.created_at).to be < Time.now
  end

  it { expect{create(:customer)}.to change{Customer.all.size}.by(1) }
end
