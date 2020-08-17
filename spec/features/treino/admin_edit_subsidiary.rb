require 'rails_helper'

feature 'admin tries to update data' do
    scenario 'successfully' do

        subsidiary = Subsidiary.create!(name: 'Unidade Tatuapé', 
        cnpj: '9999999999999', address: 'Icarai, 162')
        
        visit root_path
        click_on 'Filiais'
        click_on 'Unidade Tatuapé'
        click_on 'Alterar dados'

        fill_in 'Nome', with: 'Unidade Penha'
        fill_in 'nº do CNPJ', with: '8888888888888'
        fill_in 'Endereço', with: 'Rua Icarai, 160' 
        click_on 'Salvar alterações'
        
        expect(page).to have_content('Unidade Penha')
        expect(page).to have_content('8888888888888')
        expect(page).to have_content('Rua Icarai, 160')
    
    end 
end       
