require 'rails_helper'

feature 'Admin searches rental' do
    scenario 'and find exact match' do
        #arrange
        client = Client.create!(name: 'Fulano Sicrano', email: 'client@text.com', cpf: '399.479.898-10')
           
        car_category = CarCategory.create!(name: 'A', daily_rate: 1, 
            car_insurance: 1, third_party_insurance: 1)
            
        user = User.create!(email: 'user@test.com', name: 'Sicrano Fulano',
            password: '12345678')

        rental = Rental.create!(start_date: Date.current, end_date: 1.day.from_now, 
            client: client, car_category: car_category, user: user)
        
        another_rental = Rental.create!(start_date: Date.current, end_date: 3.day.from_now, 
            client: client, car_category: car_category, user: user)    
           
        #act
        login_as user, scope: :user
        visit root_path
        click_on 'Locações'

        fill_in 'Código de locação', with: rental.token
        click_on 'Buscar'

        expect(page).to have_content(rental.token)
        expect(page).not_to have_content(another_rental.token)
        expect(page).to have_content(rental.client.name)
        expect(page).to have_content(rental.client.cpf)
        expect(page).to have_content(rental.client.email)
        expect(page).to have_content(rental.user.email)
        expect(page).to have_content(rental.car_category.name)


    end
end
