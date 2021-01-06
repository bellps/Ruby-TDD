require 'student'
require 'course'

describe 'Mock' do
    #no mock, as fases de exercise e verify se invertem
    it '#bar' do
        #setup
        student = Student.new

        #verify
        expect(student).to receive(:bar) #ele fica esperando o comportamento acontecer, por
                                         #isso deve ser depois

        #exercise
        student.bar
    end

    it 'args' do
        student = Student.new
        #mock com registrição de argumentos
        expect(student).to receive(:foo).with(123)
        student.foo(123)
    end

    it 'repetição' do
        student = Student.new
        expect(student).to receive(:foo).with(123).twice
        student.foo(123)
        student.foo(123)
    end

    it 'retorno' do
        student = Student.new

        #retorna o valor que eu quiser
        expect(student).to receive(:foo).with(123).and_return("sabão")
        puts student.foo(123)
    end
end