describe 'Matchers de classes' do
    it 'be_instance_of' do
        expect(10).to be_instance_of(Integer) #deve ser exatamente essa classe
    end

    it 'be_kind_of' do
        expect(10).to be_kind_of(Integer) #pode ter adquirido a classe por herança
    end

    it 'respond_to' do
        expect("ruby").to respond_to(:size)
        expect("ruby").to respond_to(:count)
    end

    #iguais ao 
    it 'be_a' do
        expect("10").to be_a(String)
    end

    it 'be_an' do
        expect(10).to be_an(Integer)
    end
end