describe 'Matchers de igualdade' do
    it '#equal' do
        x = "ruby"
        y = "ruby"
        expect(x).not_to equal(y)
    end

    it '#be' do
        x = "ruby"
        y = "ruby"
        expect(x).not_to be(y)
    end

    #os dois de cima testam se o objeto é igual, já o eql testa apenas o valor
    it '#eql' do
        x = "ruby"
        y = "ruby"

        expect(x).to eql(y)
    end

    #eq faz o mesmo que o eql
    it '#eq' do
        x = "ruby"
        y = "ruby"

        expect(x).to eq(y)
    end
end