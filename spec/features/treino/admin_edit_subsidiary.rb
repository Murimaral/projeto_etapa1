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
    scenario 'but dont fill the fields properly' do
    
    subsidiary = Subsidiary.create!(name: 'Unidade Tatuapé', 
    cnpj: '9999999999999', address: 'Icarai, 162')
        
    visit root_path
    click_on 'Filiais'
    click_on 'Unidade Tatuapé'
    click_on 'Alterar dados'
    fill_in 'Nome', with: ''
    fill_in 'nº do CNPJ', with: '1234'   
    fill_in 'Endereço', with: '' 
    click_on 'Salvar alterações'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('o nº do CNPJ deve conter 13 dígitos')
    expect(page).to have_content('Endereço não pode ficar em branco')    
    end



  

end       
