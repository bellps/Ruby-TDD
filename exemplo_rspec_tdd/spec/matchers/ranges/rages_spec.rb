describe (1..5), 'Ranges' do
    it '#cover' do
        expect(subject).to cover(2)
        is_expected.to cover(2) #mesma coisa que o primeiro
        expect(subject).to cover(1,5)
    end
    
    #descrições implícitas
    it { is_expected.to cover(2) }
end