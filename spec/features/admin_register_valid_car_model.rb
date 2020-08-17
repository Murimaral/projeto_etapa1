require 'rails_helper'

feature 'Admin tries to register a car model' do
    scenario 'successfully' do

        CarCategory.create!(name: 'Top', daily_rate: 105.5, car_insurance: 58.5,
        third_party_insurance: 10.5)
    
        
        visit root_path
        click_on 'Modelos de carro'
        click_on 'Cadastrar um novo modelo'

        fill_in 'Nome', with: 'Ka'
        fill_in 'Ano', with: '2019'
        fill_in 'Fabricante', with: 'Ford'
        fill_in 'Motorização', with: '1.0'
        fill_in 'Tipo de combustível', with: 'Flex'
        select 'Top', from: 'Categoria de carro'
        click_on 'Enviar'

        expect(page).to have_content('Ka')
        expect(page).to have_content('2019')
        expect(page).to have_content('Ford')
        expect(page).to have_content('1.0')
        expect(page).to have_content('Flex')
        expect(page).to have_content('Top')
        
    end

    scenario 'but no car models yet registered' do

        visit root_path
        click_on 'Modelos de carro'
        click_on 'Cadastrar um novo modelo'

       
        click_on 'Enviar'
        
        expect(page).to have_content('Nome não pode ficar em branco')
        expect(page).to have_content('Ano não pode ficar em branco')
        expect(page).to have_content('Fabricante não pode ficar em branco')
        expect(page).to have_content('Motorização não pode ficar em branco')
        expect(page).to have_content('Tipo de combustível não pode ficar em branco')
        expect(page).to have_content('Categoria de carro é obrigatório(a)')
    end    

end