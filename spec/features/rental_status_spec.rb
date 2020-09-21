require 'rails_helper'

feature 'User starts rental' do
   xscenario 'successfully' do
    client = Client.create!(name: 'Fulano Sicrano', email: 'client@text.com', cpf: '399.479.898-10')
           
    car_category = CarCategory.create!(name: 'A', daily_rate: 1, 
        car_insurance: 1, third_party_insurance: 1)
    
    car_model = CarModel.create!(name: 'Ka', year: 2018, manufacturer: 'Ford', 
        motorization: '1.0', car_category: car_category, fuel_type: 'Flex')    
        
    user = User.create!(email: 'user@test.com', name: 'Sicrano Fulano',
        password: '12345678')

    rental = Rental.create!(start_date: Date.current, end_date: 1.day.from_now, 
        client: client, car_category: car_category, user: user)
    
    car = Car.create!(license_plate: 'ABC123', color: 'Prata', 
                        car_model: car_model, mileage: 0)    


    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    fill_in 'Código de locação', with: rental.token
    click_on 'Buscar'
    click_on 'Ver detalhes'
    click_on 'Iniciar locação'
    select "#{car_model.name} - #{car.color} - #{car.license_plate}", 
    from: 'Carros disponíveis'
    fill_in 'CNH do condutor', with: 'RJ200100-10'
    travel_to Time.zone.local(2020, 10, 01, 12, 30, 45) do

        click_on 'Iniciar locação'
    end
    puts '------------------------'
    #TODO: pegar nome, cnh do condutor, foto do carro
    expect(page).to have_content('Locação iniciada com sucesso')
    expect(page).to have_content(car.color)
    expect(page).to have_content(car.license_plate)
    expect(page).to have_content(car_model.name)
    expect(page).to have_content(client.name)
    expect(page).to have_content(car_category.name)
    expect(page).to have_content(user.email)
    expect(page).to have_content('RJ200100-10')
    expect(page).to have_content(client.cpf)
    expect(page).to have_content(client.email)
    expect(page).to have_content("01 de outubro de 2020, 12:30:45")
    #quando temos rotas aninhadas e queremos passar como parametro de um formulario
    #inves de passar apenas @car_rental, temos que passar [@rental, @car_rental] sequencia do aninhamentor
   end 

   scenario 'and dont view other car models cars' do
    client = Client.create!(name: 'Fulano Sicrano', email: 'client@text.com', cpf: '399.479.898-10')
           
    car_category = CarCategory.create!(name: 'A', daily_rate: 1,
            car_insurance: 1, third_party_insurance: 1)

    car_categoryb = CarCategory.create!(name: 'B', daily_rate: 10, 
        car_insurance: 5, third_party_insurance: 5)    
    
    car_model = CarModel.create!(name: 'Ka', year: 2018, manufacturer: 'Ford', 
        motorization: '1.0', car_category: car_category, fuel_type: 'Flex')    

    fusion_model = CarModel.create!(name: 'Fusion', year: 2018, manufacturer: 'Chevrolet', 
        motorization: '2.0', car_category: car_category, fuel_type: 'Flex')    
    
    schedule_user = User.create!(email: 'schedule@test.com', name: 'Jason Mraz',
        password: '12345abc') 
        
    user = User.create!(email: 'user@test.com', name: 'Sicrano Fulano',
        password: '12345678')

    rental = Rental.create!(start_date: Date.current, end_date: 1.day.from_now, 
        client: client, car_category: car_category, user: user)
    
    car = Car.create!(license_plate: 'ABC123', color: 'Prata', 
                        car_model: car_model, mileage: 0, status: :available)  
                        
    car_fusion = Car.create!(license_plate: 'ABC111', color: 'Azul', 
                        car_model: fusion_model, mileage: 0, status: :available) 
                        
    car3 = Car.create!(license_plate: 'ABC333', color: 'Prata', 
                        car_model: car_model, mileage: 0, status: :rented)   


    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    fill_in 'Código de locação', with: rental.token
    click_on 'Buscar'
    click_on 'Ver detalhes'
    click_on 'Iniciar locação'
    select "#{car_model.name} - #{car.color} - #{car.license_plate}", 
    from: 'Carros disponíveis'
    fill_in 'CNH do condutor', with: 'RJ200100-10'
    travel_to Time.zone.local(2020, 10, 01, 12, 30, 45) do

        click_on 'Iniciar locação'
    end
    expect(car.reload).to be_rented #da um refresh no car declarado no teste e o sincroniza com o BANCO
    expect(page).to have_content('Locação iniciada com sucesso')
    expect(page).to have_content(car.color)
    expect(page).to have_content(car.license_plate)
    expect(page).to have_content(car_model.name)
    expect(page).to have_content(client.name)
    expect(page).to have_content(car_category.name)
    expect(page).to have_content(user.email)
    expect(page).to have_content('RJ200100-10')
    expect(page).to have_content(client.cpf)
    expect(page).to have_content(client.email)
    expect(page).to have_content("01 de outubro de 2020, 12:30:45")
    expect(page).to have_content('Em andamento')

end  

end
