describe 'Matchers de comparação' do
    it '>' do
        expect(5).to be > 1
    end

    it '>=' do
        expect(5).to be >= 2
        expect(5).to be >= 5
    end

    it '<' do
        expect(5).to be < 10
    end

    it '<=' do
        expect(5).to be <= 8
        expect(5).to be <= 5
    end

    it 'be_between' do
        expect(7).to be_between(2,7).inclusive # pode ser 2,3,4,5,6 e 7
        expect(5).to be_between(2,7).exclusive # pode ser 3,4,5 e 6
    end

    # it 'be_between | falhas agregadas', :aggregate_failures do
    #     expect(6).to be_between(2,7).inclusive 
    #     expect(2).to be_between(2,7).exclusive 
    #     expect(5).not_to be_between(2,7).exclusive
    # end

    it 'match' do
        expect("fulano@hotmail.com").to match(/..@../)
    end

    it 'start_with' do
        expect("Fulano de tal").to start_with("Fulano")
        expect([1,2,3]).to start_with(1)
    end

    it 'end_with' do
        expect("Fulano de tal").to end_with("tal")
        expect([1,2,3]).to end_with(3)
    end
end