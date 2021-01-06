require 'calculator'

RSpec.describe Calculator, "(uma calculadora)" do

    # hooks: eles vão aparecer um embaixo do outro, mas estão sendo executados na ordem certa sim
    # before(:each) do
    #     puts "anteS DE CADA TESTE"
    # end

    # after(:each) do
    #     puts "DEPOIS DE CADA TESTE"
    # end
    # ============================================================================================

    #subject(:calc) {described_class.new()} para usar o calc como instancia
    context '#sum' do
        it 'with positive numbers' do
            result = subject.sum(5,7) #exercise
            expect(result).to eq(12) #verify
            #teardown: automático
        end

        it 'with a negative number' do
            result = subject.sum(-5,7)
            expect(result).to eq(2)
        end

        it 'with negative numbers' do
            result = subject.sum(-5,-7)
            expect(result).to eq(-12)
        end
    end
    
    context '#div' do
        it 'divide by 0' do
            #se não colocar em bloco, ele vai cair no erro antes da comparação
            expect{subject.div(3,0)}.to raise_exception(ZeroDivisionError)
            expect{subject.div(10,0)}.to raise_exception(/divided/) #um erro que tem essa palavra no meio
        end
    end
end