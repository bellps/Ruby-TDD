require 'contador'

describe 'Matcher change' do
    it { expect{Contador.incrementa}.to change{ Contador.qtde } }
    it { expect{Contador.incrementa}.to change{ Contador.qtde }.by(1) }
    it { expect{Contador.incrementa}.to change{ Contador.qtde }.from(2).to(3) }
end