class Contador
    @qtde = 0

    def self.qtde
        @qtde
    end

    def self.incrementa
        @qtde += 1
    end
end