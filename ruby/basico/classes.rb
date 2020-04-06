# Ruby é uma linguagem considerada puramente Orientada a Objetos
# Porque no Ruby tudo são objetos

# Classe possui atributos e métodos
# Características e Ações

# Carro(Nome, Marca, Modelo, Cor, Quantidade de Portas, etc...)
# Ligar, Businar Parar etc..

class Carro
    attr_accessor :nome #criando atributo para ler o definir valor

    def ligar
        puts 'O carro está pronto para iniciar o trajeto'
    end
end

civic = Carro.new;
civic.nome = 'Civic';

puts civic.nome;
civic.ligar;