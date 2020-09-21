require 'rails_helper'

#nao precisa do type: :response pq ja esta na pasta requests
# rails new nome --api cria um api, sem criar pastas de uma app completa como views etc

describe 'Car management'do
    context 'index' do
        it 'renders available cars' do
        #FactoryBot.create_list(:car, status: :available) daria erro pq criaria mesmas categorias de novo
        #car = FactoryBot.create(:car, license_plate:'ABC1234', status::available)
        #FactoryBot.create(:car, license_plate:'ABC9999', status::available, car_model: car.car_model) e assim pro car_category  
            car_category = CarCategory.create!(name: 'A', daily_rate:100, car_insurance: 100,
                                               third_party_insurance: 100)
            car_model = CarModel.create!(name: 'Onix', year: 2019, 
                                    manufacturer: 'Chevrolet', fuel_type: 'Flex',
                                    car_category: car_category, motorization: '1.0')
            Car.create!(license_plate: 'ABC1234', color: 'Vermelho',
                                mileage: 300, car_model: car_model, status: :available) 
            Car.create!(license_plate: 'ABC9999', color: 'Verde',
                                mileage: 200, car_model: car_model, status: :available)
            Car.create!(license_plate: 'ABC0000', color: 'Preto',
                                mileage: 100, car_model: car_model, status: :rented)
  
           
            get '/api/v1/cars'      #v1 = versao 1, podem vir mais ao longo do desenv     
            # to be_ok  to be_not_found
            expect(response).to have_http_status(200)
            body = JSON.parse(response.body, symbolize_names: true)
            expect(body[0][:license_plate]).to eq('ABC1234')
            expect(body.count).to eq 2
            expect(response.body).to include('ABC1234')  
            expect(response.body).to include('ABC9999')  
            expect(response.body).not_to include('ABC0000')         
        end
    end

    

end       

