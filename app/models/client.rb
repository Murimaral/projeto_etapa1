class Client < ApplicationRecord
has_many :rental
  def information
    "#{name} - #{cpf}" 
  end
    
end
