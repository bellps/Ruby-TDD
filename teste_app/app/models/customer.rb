class Customer < ApplicationRecord
    has_many :orders

    validates :address, presence: true
    def saudacao
        "Bom dia #{name}"
    end
end
