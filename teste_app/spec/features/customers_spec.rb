require 'rails_helper'
require_relative '../support/new_customer_form'

RSpec.feature "Customers", type: :feature, js: true do
  let(:new_customer_form) { NewCustomerForm.new }
  it 'Visit the index', vcr: { cassette_name: 'capybara/teste', :record => :new_episodes } do
    visit(customers_path)
    #save_and_open_screenshot
    expect(page).to have_current_path(customers_path)
  end

  it 'Creates a customer' do
    member = create(:member)
    login_as(member, :scope => :member) #se loga com o capybara no devise
    visit(new_customer_path)

    #preenche o formulário
    fill_in('Name', with: Faker::Name.name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Address', with: Faker::Address.street_address)
    click_button('Create Customer')

    #checa se apareceu um texto falando que o customer foi criado
    expect(page).to have_content('Customer was successfully created.') 
  end

  it 'Creates customer - Page Object Pattern' do
    # se cria uma classe com os steps do 'Creates a customer'
    new_customer_form.login.visit_page.fill_in_with(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      address: Faker::Address.street_address
    ).submit
 
    expect(page).to have_content('Customer was successfully created.') 
  end

  it 'Ajax' do
    visit(customers_path)
    click_link('Add Message')
    expect(page).to have_content('Yes!')
  end

  it 'Find' do
    visit(customers_path)
    click_link('Add Message')
    # faz a mesma coisa que o 'Ajax', porém procura direto pelo elemento e não na página toda,
    # pois pode acontecer de ter a mesma mensagem em outro lugar dela.
    expect(find('#my-div').find('h1')).to have_content('Yes!')
  end
end
