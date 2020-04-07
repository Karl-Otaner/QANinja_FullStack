

describe 'Caixa de Opções', :dropdown do
    
    it 'item especifico simples' do # metodo select simples, tendo o Id consegue resolver de uma forma muito simples
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        select('Loki', from: 'dropdown') # Opção funciona exclusivamento com elementos do tipo select que possuem Id
        sleep 3
    end

    it 'item especifico com o find' do # metodo especifico com o find, atravez do texto da opção
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option # Busque uma opção cujo o valor do texo é Scott Lang e selecione essa opcão
        # find é o metodo de busca do capybara
        sleep 3
    end
    
    it 'qualquer item', :sample do # Esolha qualquer uma das opções aleatoriamente
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        drop = find('.avenger-list')
        # drop.find('option') # faz uma busca + especifica
        drop.all('option').sample.select_option # Metodo sample escolhe uma busca randomica dos elementos e o select_option escolhe um
        sleep 1
    end

end