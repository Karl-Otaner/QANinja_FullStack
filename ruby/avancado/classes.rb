# Um construtor é um metodo que é executado toda vez que se cria um objeto 

class Conta
    attr_accessor :saldo, :nome

    def initialize(nome)
        self.saldo = 0.0;
        self.nome = nome;
    end

    def deposita(valor)       
       self.saldo += valor;
       puts "Depositanto a quantia de #{valor} reais na conta de #{self.nome}."; # Concatenação / interpolação de string -> + elegante e eficiente 
    end    
end

c = Conta.new('Carlos')

c.deposita(100.00)
puts c.saldo

c.deposita(10.00);
puts c.saldo;
puts c.nome;