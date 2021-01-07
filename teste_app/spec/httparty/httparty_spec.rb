describe 'HTTParty' do
    # colocando o :vcr na frente ele já cria a cassette
    # o match_requests verifica a url enviada e testa através do body, e não da url/verbo
    # assim eu posso colocar urls meio diferentes mas ele não dá erro
    it 'Verifica o tipo do conteúdo', vcr: { cassette_name: 'jsonplaceholder/posts', :record => :new_episodes } do
        # webmock: cria uma request falsa
        # stub_request(:get, "https://jsonplaceholder.typicode.com/posts/2").
        #     to_return(status: 200, body: "", headers: {'content_type': 'application/json'})
        response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/10')
        content_type = response.headers['content-type']
        expect(content_type).to match(/application\/json/)
    end
end