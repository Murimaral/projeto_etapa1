require 'rails_helper'

feature 'admin schedule date of rent' do
    scenario 'successfully' do

        CarCategory.create!(name: 'A', car_insurance:100, 
        daily_rate:50, third_party_insurance:100)
        
        Client.create!(name: 'Fulano Sicrano', cpf: '399.479.898-10',
        email: 'teste@client.com')
        
        user = User.create!(name: 'Lorem Ipsum', email: 'lorem@ipsum.com',
        password: '12345678')

        login_as user, scope: :user
        visit root_path
        click_on 'Locações'
        puts "============================="
        puts current_path
        puts "============================="
        click_on 'Agendar nova locação'
        puts "============================="
        puts current_path
        puts "============================="
        fill_in "Data de início", with: '21/08/2030' #antes de continuar RESOLVE ISSO
        fill_in 'Data de término', with: '23/08/2030'
        select 'Fulano Sicrano - 399.479.898-10', from: 'Cliente'
        select 'A', from: 'Categoria de carro'
        click_on 'Agendar' 

        expect(page).to have_content('21/08/2030') #na view podemos usar por exemplo l @rental.start_date > retorna data 21/08/2030. 
        
        #uma outra forma seria @rental.start_date.strftime(d%/m%/Y%) e retorna tambem 21/08/2030
        #podemos usar a forma longa>> l @rental.start_date, format: :long
        expect(page).to have_content('23/08/2030')
        expect(page).to have_content('Fulano Sicrano')
        expect(page).to have_content('399.479.898-10')
        expect(page).to have_content('teste@client.com')
        expect(page).to have_content('A')
        expect(page).to have_content('R$ 500,00')
        expect(page).to have_content('Agendamento realizado com sucesso')
        #2.days.from_now >> 2
        #2.days.from_now.to_date (retorna a data daqui a dois dias)
        #Date.current
        #(3.days.from_now - 1.days.from_now).class = rational
        #(3.days.from_now - 1.days.from_now)/1.day
        #metodo .ceil >> arredonda pra cima
        #metodo .floor >> arredonda pra baixo
    end
end
