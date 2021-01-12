require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  scenario 'Verifica link Cadastro de Clientes' do
    visit(root_path)
    expect(page).to have_link('Cadastro de Clientes')
  end

  scenario 'Verifica link de Novo Cliente' do
    visit(root_path)
    click_on('Cadastro de Clientes')
    expect(page).to have_content('Listando clientes')
    expect(page).to have_link('Novo cliente')
  end

  scenario 'Verfica formulário de novo cliente' do
    visit(customers_path)
    click_on('Novo cliente')
    expect(page).to have_content('Novo cliente')
  end

  # happy path: o cenário ideial, com o cliente fazendo examente o que nós queremos
  scenario 'Cadastra um cliente válido' do
    visit(new_customer_path)
    customer_name = Faker::Name.name
    fill_in('Nome', with: customer_name)
    fill_in('Email', with: Faker::Internet.email(name: customer_name))
    fill_in('Telefone', with: Faker::PhoneNumber.phone_number)
    attach_file('Foto do perfil', "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: ['S', 'N'].sample)
    click_button('Enviar')

    expect(page).to have_content('Cliente cadastrado com sucesso!')
    expect(Customer.last.name).to eq(customer_name)
  end

  # sad path: o cenário onde o usuário faz merda (mais conhecido como realidade)
  scenario 'Não cadastra um cliente inválido' do
    visit(new_customer_path)
    click_button('Enviar')
    expect(page).to have_content('não pode ficar em branco')
  end
  
  scenario 'Mostra um cliente' do
    customer = create(:customer)

    visit(customer_path(customer.id))
    expect(page).to have_content(customer.name, customer.email).and have_content(customer.phone) 
  end

  scenario 'All customers at the index' do
    customer = create(:customer)
    customer2 = create(:customer)

    visit(customers_path)
    expect(page).to have_content(customer.name, customer2.name)
  end

  scenario 'Atualiza um cliente' do
    customer = create(:customer)
    new_name = Faker::Name.name
    visit(edit_customer_path(customer))
    fill_in('Nome', with: new_name)
    click_button('Enviar')
    expect(page).to have_content('Cliente atualizado com sucesso!').and have_content(new_name)
  end

  scenario 'clicando no botão ver' do
    customer = create(:customer)
    visit(customers_path)
    click_on('Ver')
    expect(page).to have_content(customer.phone)
  end

  scenario 'clicando no botão editar' do
    customer = create(:customer)
    visit(customers_path)
    click_on('Editar')
    expect(page).to have_xpath("//input[@value='#{customer.name}']")
  end
  
  # js: true para conseguirmos interagir com o alert
  scenario 'apaga um cliente', js: true do
    customer = create(:customer)
    visit(customers_path)
    click_on('Excluir')
    #aceita o alert que apareceu na tela
    1.second
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('Cliente excluido com sucesso!')
  end
end
