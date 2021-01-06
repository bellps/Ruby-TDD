describe 'be_within' do
    it { expect(11.5).to be_within(0.5).of(12) } #estar entre 11.5 e 12.5
    
    teste = [11.9, 12.4, 12.1]
    it { expect(teste).to all(be_within(0.5).of(12)) }
end
