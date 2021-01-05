require 'pessoa'

describe 'Atributos' do
    it 'have_attributes' do
        pessoa = Pessoa.new
        pessoa.nome = "Zabella"
        pessoa.idade = 18
        #expect(pessoa).to have_attributes(:nome => "Zabella")

        expect(pessoa).to have_attributes(
            :nome => starting_with("Z"), 
            :idade => (be < 40)
        )
    end
end