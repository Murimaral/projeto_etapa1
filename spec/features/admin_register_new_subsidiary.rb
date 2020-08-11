require 'rails_helper'

feature 'Admin tries to register a new subsidiary' do
    
    scenario 'from the homepage' do
        
        visit root_path
        click_on 'Filiais'
        

        expect(page).to have_link('Registrar uma nova filial', href: new_subsidiary_path)

    end

    scenario 'filling and submiting the form' do

        Subsidiary.create!(name: 'Filial A', cnpj: '99.999.999/0001-99', address: 'Urumajo, 155')
        
        visit root_path
        click_on 'Filiais'
        click_on 'Registrar uma nova filial'
        fill_in 'Nome', with: 'Unidade Tatuapé'
        fill_in 'nº do CNPJ', with: '10.101.010/0001-01'
        fill_in 'Endereço', with: 'Icarai, 162' 
        click_on 'Enviar'   

        expect(current_path).to eq subsidiary_path(Subsidiary.last)
        expect(page).to have_content('Unidade Tatuapé')
        expect(page).to have_content('10.101.010/0001-01')
        expect(page).to have_content('Icarai, 162')
        expect(page).to have_link('Voltar')
    end     

end    
