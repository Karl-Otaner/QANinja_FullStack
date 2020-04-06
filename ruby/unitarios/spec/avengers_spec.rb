
class AvengersHeadQuarter
    attr_accessor :list

    def initialize  # Contrutor 
        self.list = [] # Array vazio
    end
        
    def put(avenger)
        puts self.list.class # Tipo de Debug manual
        self.list.push(avenger)
    end
end

# TDD (Desenvolvimento guiado por testes)
describe AvengersHeadQuarter do #criado a suite
    it 'deve adicionar um vingador' do # cenario
        hq = AvengersHeadQuarter.new # classe instaciada

        hq.put('Spiderman') # Adicionado o item
        # expect(hq.list).to eql ['Spiderman']   # Verificar se o item foi adicionado
        expect(hq.list).to include 'Spiderman'   # Verificar se na lista contem o 'Spiderman'
    end

    it 'deve adicionar uma lista de vingadores' do
        hq = AvengersHeadQuarter.new
        hq.put('Thor')
        hq.put('Hulk')
        hq.put('Spiderman')
        
        res = hq.list.size > 0 # Guarda na variavel 'res'
        
        expect(hq.list.size).to be > 0 # 
        expect(res).to be true # 
    end
    
    it 'thor deve ser o primeiro da lista' do
        hq = AvengersHeadQuarter.new
        hq.put('Thor')
        hq.put('Hulk')
        hq.put('Spiderman')

        expect(hq.list).to start_with('Thor')

    end
    
    it 'Ironman deve ser o último da lista' do
        hq = AvengersHeadQuarter.new

        hq.put('Thor')
        hq.put('Hulk')
        hq.put('Spiderman')
        hq.put('Ironman')

        expect(hq.list).to end_with('Ironman')
    end

    it 'deve conter o sobrenome' do
        avenger = 'Peter Parker'

        expect(avenger).to match(/Parker/) # Contém o nome na lista
        expect(avenger).not_to match(/Carlos/) # Não contém o nome na lista

    end



end