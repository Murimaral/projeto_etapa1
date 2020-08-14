require 'rails_helper'

feature 'admin view registered car models' do
    scenario 'succesfully' do

        car_category = CarCategory.create!(name: 'Top', daily_rate: 50, car_insurance: 100, third_party_insurance: 20)
        car_model = CarModel.create!(name: 'Ka', year: 2018, manufacturer: 'Ford', 
        motorization: '1.0', car_category: car_category, fuel_type: 'Flex')
        car_model = CarModel.create!(name: 'Onix', year: 2017, manufacturer: 'Chevrolet', 
        motorization: '2.0', car_category: car_category, fuel_type: 'Etanol')

        visit root_path
        click_on 'Modelos de carro'

        expect(page).to have_content('Ka')
        expect(page).to have_content('Ford')
        expect(page).to have_content('2018')
        expect(page).to have_content('2017')
        expect(page).to have_content('Onix')
        expect(page).to have_content('Chevrolet')
        expect(page).to have_content('Ka')
        expect(page).to have_content('Top', count: 2) #expressao /A/ regular procura "A"ses 

    end

    scenario 'and choose one to view details' do

        car_category = CarCategory.create!(name: 'Top', daily_rate: 50, car_insurance: 100, third_party_insurance: 20)
        car_model = CarModel.create!(name: 'Ka', year: 2018, manufacturer: 'Ford', 
        motorization: '1.0', car_category: car_category, fuel_type: 'Flex')
        car_model = CarModel.create!(name: 'Onix', year: 2017, manufacturer: 'Chevrolet', 
        motorization: '2.0', car_category: car_category, fuel_type: 'Etanol')

        visit root_path
        click_on 'Modelos de carro'
        click_on 'Ka - 2018'

        expect(page).to have_content('Ka')
        expect(page).to have_content('Ford')
        expect(page).to have_content('2018')
        expect(page).to have_content('1.0')
        expect(page).to have_content('Flex')
        expect(page).to have_content(car_category.name) #uma outra forma tbm permitida
        expect(page).to have_content('50')
        expect(page).to have_content('100')
        expect(page).to have_content('20')
        expect(page).not_to have_content('Onix')
        expect(page).to have_link('Voltar', href: car_models_path)

    end  


    scenario 'but no models are yet registered' do

        visit root_path
        click_on 'Modelos de carro'

        expect(page).to have_content('Não há modelos cadastrados')
        expect(page).to have_link('Voltar', href: root_path)
       
    end
end


