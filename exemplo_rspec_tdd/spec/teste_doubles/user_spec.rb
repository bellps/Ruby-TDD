describe 'Test Double' do
    it '--' do
        abc = double('User')
        allow(abc).to receive_messages(name: 'Jack', password: 'secret')
        puts abc.inspect
        abc.name
    end

    it 'as_null_object' do
        #qualquer chamada ao double que retornar uma mensagem de erro será dispensada
        abc = double('User').as_null_object
        allow(abc).to receive_messages(name: 'Jack', password: 'secret')
        puts abc.inspect
        abc.name

        abc.abc
    end
end