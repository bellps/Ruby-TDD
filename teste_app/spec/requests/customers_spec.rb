require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    # coloquei esse before each para ter pelo menos um registro no banco antes de testar, se não dá erro
    before(:each) do
      member = create(:member)
      login_as(member, scope: :member)

      # informa na requisição que estamos enviando o dado no formato json
      @headers = { "ACCEPT" => "application/json"}
      @customers_params = attributes_for(:customer)
      post "/customers.json", params: { customer: @customers_params }, headers: headers
    end

    it 'JSON Schema' do
      get '/customers/1.json'
      p response.body
      # espera que a resposta bata com o padrão definido no schema customer.json
      expect(response).to match_response_schema('customer')
    end

    it "works" do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it 'index - JSON! 200 OK' do
      get "/customers.json"

      expect(response.body).to include_json([
        "id": /\d/,
        "name": (be_kind_of String),
        "email": (be_kind_of String),
      ])
    end

    it 'show - gem do waterlink' do
      get "/customers/1.json"
      expect(response.body).to include_json({
        "id": /\d/
      })
    end

    it 'show - Rspec puro' do
      get "/customers/1.json"
      response_body = JSON.parse(response.body)
      expect(response_body.fetch("id")).to eq(1)
      expect(response_body.fetch("name")).to be_kind_of(String)
    end

    it 'create - JSON' do
      expect(response.body).to include_json(
        "id": /\d/,
        "name": @customers_params.fetch(:name), # retorna um erro caso não ache no array
        "email": @customers_params.fetch(:email),
      )
    end

    it 'update - JSON' do
      customer = Customer.first
      customer.name += " - ATUALIZADO"

      patch "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: @headers

      expect(response.body).to include_json(
        "id": /\d/,
        "name": customer.name, 
        "email": customer.email
      )
    end

    it 'delete - JSON' do
      customer = Customer.first
      expect {
        delete "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: @headers 
      }.to change(Customer, :count).by(-1) # ve se subtraiu do banco mesmo

      expect(response).to have_http_status(204) # "no content", pois após o delete, a página .json vem vazia
    end

  end
end
