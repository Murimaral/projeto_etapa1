require 'rails_helper'

describe Subsidiary, type: :model do
    context 'validation' do
        it 'attributes cannot be blank' do

            subsidiary = Subsidiary.new

            subsidiary.valid?

            expect(subsidiary.errors[:name]).to include('não pode ficar em branco')
            expect(subsidiary.errors[:cnpj]).to include('não pode ficar em branco')
            expect(subsidiary.errors[:address]).to include('não pode ficar em branco')

        end
        
        it 'name and cnpj must be unique' do

            Subsidiary.create!(name: 'Unidade Tatuapé', cnpj: '9999999000113', address: 'Urumajo, 155')
            
            subsidiary = Subsidiary.new(name: 'Unidade Tatuapé', cnpj: '9999999000113', address: 'Urumajo, 155')
            
            subsidiary.valid?

            expect(subsidiary.errors[:name]).to include('já está em uso')
            expect(subsidiary.errors[:cnpj]).to include('já está em uso')
        end    

        it 'cnpj must contain 13 digits' do

            subsidiary = Subsidiary.new(cnpj:'123')
            
            subsidiary.valid?  
            
            expect(subsidiary.errors[:cnpj]).to include('o nº do CNPJ deve conter 13 dígitos')
        end     
                
    end
end            