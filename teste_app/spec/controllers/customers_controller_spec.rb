require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  context 'As a guest' do
    it '#index responds a 200 response' do
      get :index
      # be_success é um alias para have_http_status "200"
      expect(response).to be_success
    end
  
    it '#show responds a 302 response' do
      customer = create(:customer)
      get :show, params: { id: customer.id }
      expect(response).to have_http_status(302) # como não está logado e a rota é restrita, dá erro
    end
  end

  context 'As logged member' do
    before(:each) do 
      member = create(:member)
      @customer = create(:customer)
      @customer_params = attributes_for(:customer) #pega só os atributos e traz em hash

      sign_in member # loga o membro do devise para dar acesso as rotas restritas
    end 

    it { is_expected.to route(:get, '/customers').to(action: :index) }

    it 'Content-Type' do
      post :index, format: :json, params: { customer: @customer.id }
      expect(response.content_type).to eq('application/json')
    end

    it 'Flash notice' do
      post :create, params: { customer: @customer_params }
      expect(flash[:notice]).to match(/successfully created/)
    end

    it 'With valid attributes' do
      expect{
        post :create, params: { customer: @customer_params }
      }.to change(Customer, :count).by(1)
    end

    it 'With invalid attributes' do
      customer_params = attributes_for(:customer, address: nil)
      expect{
        post :create, params: { customer: customer_params }
      }.not_to change(Customer, :count) # como é inválido não vai mudar a contagem do model
    end

    it '#show' do
      get :show, params: { id: @customer.id }
      expect(response).to have_http_status(200)
    end

    it 'render a :show template' do
      get :show, params: { id: @customer.id }
      expect(response).to render_template(:show)
    end
  end

end
