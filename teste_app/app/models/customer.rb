class Customer < ApplicationRecord
    def saudacao
        "Bom dia #{name}"
    end
end
