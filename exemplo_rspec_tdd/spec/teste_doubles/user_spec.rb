describe 'Test Double' do
    it '--' do
        abc = double('User')
        allow(abc).to receive_messages(name: 'Jack', password: 'secret')
        puts abc.inspect
        abc.name
    end
end