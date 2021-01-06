require 'pessoa'

describe 'Atributos com let' do
    let(:pessoa) { Pessoa.new }

    it 'have_attributes' do
        pessoa.nome = "Zabella"
        pessoa.idade = 18

        expect(pessoa).to have_attributes(
            :nome => starting_with("Z"), 
            :idade => (be < 40)
        )
    end
end