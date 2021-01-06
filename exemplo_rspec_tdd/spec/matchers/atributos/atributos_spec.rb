require 'pessoa'

describe 'Atributos' do
    #roda envolta do teste
    around(:each) do |teste|
        @pessoa = Pessoa.new
        teste.run # roda o teste
        puts "cabou"
    end

    it 'have_attributes' do
        @pessoa.nome = "Zabella"
        @pessoa.idade = 18
        #expect(pessoa).to have_attributes(:nome => "Zabella")

        expect(@pessoa).to have_attributes(
            :nome => starting_with("Z"), 
            :idade => (be < 40)
        )
    end
end