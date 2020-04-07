

describe 'Forms' do

    it 'login com sucesso' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'

        fill_in 'userId', with: 'stark'
        fill_in 'password', with: 'jarvis!'

        click_button 'Login'

        expect(find('#flash').visible?).to be true

        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
                # O includ é um contains para o ruby
                # Aqui vc está obtendo o texto (.text) e perguntando se esse valor 'Olá, Tony...' contem no texto 
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
                # Perguntando se exite esse conteudo 'Olá, Tony...'no elemento(String) (find('#flash))""
    end

end

# Quando tiver um texto identico usa-se o eql
# Quando quiser perguntar se um valor contém na String ou se contem no 
# elemento, usa-se o include ou o have_conte