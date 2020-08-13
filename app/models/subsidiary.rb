class Subsidiary < ApplicationRecord
    validates :name, :cnpj, :address, presence: true
    validates :name, :cnpj, uniqueness: true
    validate :cnpj_diff_de_treze
    
    def cnpj_diff_de_treze
        if cnpj.present? && cnpj.count('0123456789') != 13
            errors.add(:cnpj, 'o nº do CNPJ deve conter 13 dígitos')  
        end
      end 
  

end
