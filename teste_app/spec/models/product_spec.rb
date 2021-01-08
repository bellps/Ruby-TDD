require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'Is valid with description, price and category' do
    product = create(:product)
    expect(product).to be_valid
  end

  # it 'Is invalid without description' do
  #   # aqui usamos build pois com o create dele dá o erro e não permite ser analisado
  #   # o build cria em memória só, sem mandar pro banco
  #   product = build(:product, description: nil)
  #   product.valid?
  #   expect(product.errors[:description]).to include("can't be blank")
  # end

  # it 'Is invalid without price' do
  #   product = build(:product, price: nil)
  #   product.valid?
  #   expect(product.errors[:price]).to include("can't be blank")
  # end

  # it 'Is invalid without category' do
  #   product = build(:product, category: nil)
  #   product.valid?
  #   expect(product.errors[:category]).to include("can't be blank")
  # end

  # equivalem aos testes de cima, porém mais enxutos graças ao shoulda matchers
  context 'Validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:category) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:category) }
  end

  context 'Instance Methods' do
    it '#full_description' do
      product = create(:product)
      expect(product.full_description).to eq("#{product.description} - #{product.price}")
    end
  end
 
end
